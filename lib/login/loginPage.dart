import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legitcaller/perfil/perfilPage.dart';
import 'package:legitcaller/services/auth.dart';
import 'package:legitcaller/widgets/SelectIdioma.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:legitcaller/l10n/app_localizations.dart';
import '../provider/loadingProvider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  DataProvider _db = DataProvider();
  double w=0, h=0;
  final LocalAuthentication _auth = LocalAuthentication();


  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            alignment: Alignment.centerLeft,
            child:  Text( AppLocalizations.of(context)!.ingresar, style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            alignment: Alignment.centerLeft,
            child:  Text( AppLocalizations.of(context)!.ingresar_sub, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 25, right: 30, top: 30),
            child: TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              
              decoration:  InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hoverColor: Colors.grey[100],
                hintText: "Email",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            
            ),
          ),
          Container(
            
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 25, right: 30, top: 30),
            child: TextFormField(
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscureText, // Oculta el texto si es true
              
              decoration:  InputDecoration(
                 filled: true,
                fillColor: Colors.grey[100],
                hoverColor: Colors.grey[100],
                hintText: "Password", 
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Cambia el estado para mostrar/ocultar
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                
              ),
                
              
            
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, right: 25),
            alignment: Alignment.centerRight,
            child: const Text("Forgot password?", style: TextStyle(fontSize: 12, decoration: TextDecoration.underline,),),
          ),
          Container(
                    margin: EdgeInsets.only(left: 35, top: 25),
                    alignment: Alignment.center,
                    child: Salectidioma()),
          Container(
            margin: const EdgeInsets.only(top: 35),
            child: InkWell(
              onTap: () async {

                // Provider.of<LoadingProvider>(context, listen: false).setLoad(true);

                // final result =  await _db.login(_email.text, _password.text);


                // if(result?.status == 200){
                  
                 
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const PerfilPage()),
                //   );
                //   Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
                // }

                // 1. Bloqueamos antes de la petición
                Provider.of<LoadingProvider>(context, listen: false).setLoad(true);

                try {
                  final result = await _db.login(_email.text, _password.text);

                  // 2. Verificamos si el widget sigue "vivo" antes de usar el context después de un await
                  if (!mounted) return;

                  if (result?.status == 200) {
                    // 3. PRIMERO quitamos el loading, LUEGO navegamos
                    Provider.of<LoadingProvider>(context, listen: false).setLoad(false);

                    Navigator.pushReplacement( // Usar pushReplacement para que no puedan volver al login con el botón de atrás
                      context,
                      MaterialPageRoute(builder: (context) =>  PerfilPage(userData: result,)),
                    );
                  } else {
                    // 4. Si el status no es 200, hay que desbloquear para que reintenten
                    Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
                    
                    // Mostrar error al usuario
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Credenciales incorrectas')),
                    );
                  }
                } catch (e) {
                  // 5. Siempre liberar el loader si algo falla catastróficamente (ej. sin internet)
                  if (mounted) {
                    Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
                  }
                }
              
                
                
                
              },
              child: Container(
                width: w,
                margin: const EdgeInsets.only(left: 30, right: 30),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(                      
                      Radius.circular(10.0) //         <--- border radius here
                  ),
                ),
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<bool> checkBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  // 2. Obtener lista de biometrías disponibles (huella, cara)
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
      return [];
    }
  }

  // 3. Autenticar al usuario
  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Por favor, autentícate para acceder',
        biometricOnly: true, 
        //  options: const AuthenticationOptions(
        //   biometricOnly: true,// Solo huella/cara, no PIN
        //   stickyAuth: true// Mantiene la app activa si se pausa brevemente
        // )
        );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}