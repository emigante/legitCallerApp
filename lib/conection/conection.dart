
import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:legitcaller/bloc/usuario_bloc.dart';
import 'package:http/http.dart' as http;


class DatabaseServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future guardarDatosRegistro(String idContrato, String nuevoCodigo) async {
    UsuarioBloc _usurioBloc = UsuarioBloc();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference codigosRef = firestore.collection('codigos_autenticacion');
   
    // 2. Calcular tiempos (Hora actual y Expiración en 10 minutos)
    final DateTime ahora = DateTime.now();
    final DateTime expiracion = ahora.add(Duration(minutes: _usurioBloc.tiempoCodigo ?? 5));

    try {
      // 3. (Opcional) Marcar como usados los códigos anteriores de este contrato
      final queryAnteriores = await codigosRef
          .where('idContrato', isEqualTo:  idContrato)
          .where('usado', isEqualTo: false)
          .get();

      final batch = firestore.batch();
      for (var doc in queryAnteriores.docs) {
        batch.update(doc.reference, {'usado': true});
      }
      await batch.commit();

      // 4. Guardar el nuevo código
      await codigosRef.add({
        'idContrato': idContrato,
        'codigo': nuevoCodigo,
        'createdAt': Timestamp.fromDate(ahora),
        'expiresAt': Timestamp.fromDate(expiracion),
        'usado': false,
      });

      print("Código generado con éxito: $nuevoCodigo");
      return expiracion;
    } catch (e) {
      print("Error al guardar el código en Firestore: $e");
      rethrow;
    }
  }


   Future<bool> getConfiguracion() async {
    bool version = false;
    UsuarioBloc usuarioBloc = UsuarioBloc();
    //var snap = _databaseServices.getFracionamientosById(usuario.idFraccionamiento);

    const String _url =
        "https://legitcaller-default-rtdb.firebaseio.com/configuracion.json";

    try {
      final response = await http.get(Uri.parse(_url));
      //print("Response***"+response.request.toString());
      final decodedData = jsonDecode(response.body);

      print("linea*******");
      print(decodedData["email"]);
      print(decodedData["tiempo"]);

      usuarioBloc.emailSoporte = decodedData["email"];
      usuarioBloc.tiempoCodigo = decodedData["tiempo"];
      return true;
      
    } on TimeoutException catch (exception) {
      print(
          'Error al cargar la configuracion. Tiempo de espera exedido: ${exception.message}');
    } catch (exception) {
      print("Error inesperado al cargar la configuración: $exception");
    }

    return version;
  }

  
}