
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legitcaller/l10n/app_localizations.dart';
import 'package:legitcaller/login/loginPage.dart';


class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
  double? w, h, scale;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    scale = MediaQuery.textScalerOf(context).scale(1);
    return Scaffold(
      backgroundColor: Colors.white,
        body: 
              SingleChildScrollView(
                child: SizedBox(
                height: h,
                child: Column(
                  children: [
                   
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        //width: 200,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 220, 251, 233),
                          border: Border.all(
                            width: 1.0, color: const Color(0xFF0a6641)
                          ),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(25.0) //                 <--- border radius here
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 60, left: 40, right: 110),
                        child: Row(
                          children: [
                            const Icon(Icons.circle, size: 12, color: Color(0xFF0a6641),),
                            Text(AppLocalizations.of(context)!.antifraude,
                                style: TextStyle(fontSize: scale! > 1.6 ? 16: 14, color: const Color(0xFF0a6641), fontWeight: FontWeight.bold)),
                          ],
                        )),
                   
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 44, right: 44),
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(AppLocalizations.of(context)!.antesCompartir,
                            style: TextStyle(fontSize: scale! > 1.6 ? 16: 24, color: Colors.black, fontWeight: FontWeight.bold))),
                    Container(
                        padding: const EdgeInsets.only(left: 44, right: 44, top: 25),
                        child: Text(AppLocalizations.of(context)!.antesCompartir_sub,
                          style: TextStyle(
                              fontSize: scale! > 1.6 ? 12: 16, color:const Color.fromRGBO(65, 63, 67, 0.5)),
                        )),

                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      //width: 400,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 239, 238, 238),
                        border: Border.all(
                          width: 1.0, color: Color.fromARGB(255, 208, 208, 208)
                        ),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(5.0) //                 <--- border radius here
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, size: 40, color: Colors.black,),
                          Container(
                            width: 250,
                            child: Text(AppLocalizations.of(context)!.punto1,
                                style: TextStyle(fontSize: scale! > 1.6 ? 16: 14, color: Color.fromARGB(255, 50, 50, 50), fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      //width: 400,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 239, 238, 238),
                        border: Border.all(
                          width: 1.0, color: Color.fromARGB(255, 208, 208, 208)
                        ),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(5.0) //                 <--- border radius here
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, size: 40, color: Colors.black,),
                          Container(
                            width: 250,
                            child: Text(AppLocalizations.of(context)!.punto2,
                                style: TextStyle(fontSize: scale! > 1.6 ? 16: 14, color: Color.fromARGB(255, 50, 50, 50), fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      //width: 400,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 239, 238, 238),
                        border: Border.all(
                          width: 1.0, color: Color.fromARGB(255, 208, 208, 208)
                        ),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(5.0) //                 <--- border radius here
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, size: 40, color: Colors.black,),
                          Container(
                            width: 250,
                            child: Text(AppLocalizations.of(context)!.punto3,
                                style: TextStyle(fontSize: scale! > 1.6 ? 16: 14, color: Color.fromARGB(255, 50, 50, 50), fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )),

                    InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: Container(
                          width: w,
                          //height: 220,
                          margin:const EdgeInsets.only(left: 30, right: 30, top: 90),
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.black, //Color(0xFF5E1281),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.empezar,
                                style: TextStyle(fontSize: scale! > 1.6 ? 10 : 16, color: Colors.white),
                              ),
                              const Icon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.white,
                                size: 18,
                              )
                            ],
                          )))
                  ],
            ),
      )),
      
            
          
        );
  }
}
