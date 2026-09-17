
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future guardarDatosRegistro(String idContrato, String nuevoCodigo) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference codigosRef = firestore.collection('codigos_autenticacion');
   
    // 2. Calcular tiempos (Hora actual y Expiración en 10 minutos)
    final DateTime ahora = DateTime.now();
    final DateTime expiracion = ahora.add(Duration(minutes: 10));

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
    } catch (e) {
      print("Error al guardar el código en Firestore: $e");
      rethrow;
    }
  }

  
}