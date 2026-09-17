import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:legitcaller/models/userData.dart';

class DataProvider {
  //final String _url = "https://apimadrid.commune.com.mx/api/v1/security/login";
  //final UsuarioBloc _configBloc =  UsuarioBloc();

  Future<String> getJWT() async {
    String token = await setJWT();

    return token;
  }




  Future<String> setJWT() async {
    String url = "https://cloud.sunset.com.mx:9076/api-portal/v1/token";    
    String token = "";

    final body = {
          "user":"PORTALSOCIOS",
          "password":"PORT22SUN",
          "ip":"10.194.25.15"
      };
    try {
      //print("estamos en el try");
      final response = await http.post(Uri.parse(url),
          body: json.encode(body),
          headers: {'Content-Type': 'application/json'}); // make POST request
        
        //print(response.body);
      //if (response.status != 200) {
        //print("Response Code: ${response.status}");

        final result = json.decode(response.body);

        token = result['data']['token'];
        //print(token);

        return token;
      //}

      

    } catch (e) {
      print(
          "Is not possible get the token at this time. Unexpected error:\n$e");
      //return null;
    }

    return token;
  }


  Future<UserData?> login(String email, String pwd) async {
    String url = "https://cloud.sunset.com.mx:9076/api-portal/v1/login";    
    UserData? result;

    final body = {
        
    "username": "alonzo.verdugo@gmail.com",
    "password": "123456789"

    };

    try {

      String token = await getJWT();
      //print("estamos en el try");
      final response = await http.post(Uri.parse(url),
          body: json.encode(body),
          headers: {'Content-Type': "application/json",  'X-Fusion-Token': token}); // make POST request
      //print(response.body);
      //if (response.statusCode != 200) {
        print("Response Code: ${response.body}");

        result = UserData.fromJson(json.decode(response.body))  ;

        return result;

      //}

     
      

    } catch (e) {
      print(
          "Is not possible login. Unexpected error:\n$e");
      //return null;
    }

    return result;
  }

  
  // Future<bool> validateJWTExpiration() async {
  //   DateTime now = DateTime.now();
  //   String? expirationDate = _configBloc.jwtExpirationDate;

  //   if (expirationDate!.isEmpty) return false;

  //   try {
  //     DateTime jwtExpirationDate = DateTime.parse(expirationDate);

  //     if (now.isAfter(jwtExpirationDate)) return false;
  //   } catch (e) {
  //     logError("\tNo se Logro validar el JWT. Ocurrion un error inesperado:\n$e");
  //     return false;
  //   }

  //   return true;
  // }
}
