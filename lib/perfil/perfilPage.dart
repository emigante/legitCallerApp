import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:legitcaller/conection/conection.dart';
import 'package:legitcaller/models/userData.dart';
import 'package:slide_countdown/slide_countdown.dart';

class PerfilPage extends StatefulWidget {
  UserData? userData;
  PerfilPage({super.key, required this.userData});
  //const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  double w = 0,h=0;
  bool show = false;
  String code = "";
  bool newCode = false;
  Key _countdownKey = UniqueKey(); // Llave para forzar el reinicio
  DatabaseServices db = DatabaseServices();

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caller verification", style: TextStyle(fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 25, right: 20),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("YOUR PERMANENT ID", style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),),
               // const Text("Only share this ID with the caller NOTHING ELSE", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),),
                Container(
                  width: w,
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 234, 234),
                    border: Border.all(color: const Color.fromARGB(255, 235, 234, 234),),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0) //                 <--- border radius here
                  ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Container(
                          
                          child:  Text(widget.userData?.data.contracts.first.membership.toString() ?? "", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),)),
                        const Text("Share this with the agent when the call begins", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),),
                    ],
                  ),
                ),
                (!show) ? Container(
                  width: w,
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF9E6),
                    border: Border.all(color: const  Color(0xFFD6900A)),
                  
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0) //                 <--- border radius here
                  ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          const Icon(Icons.info, color: Color(0xFFD6900A),),
                          Container(
                              width: w-100,
                              child: const Text("Only share your ID with the agent on the call. Never share password, card numbers, of other codes.", 
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFFD6900A)),)),
                         ],
                       ),
                       // const Text("Already share with the agent", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),),
                    ],
                  ),
                ) : const SizedBox(),

                (!show) ?   Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: const Text("After sharing your ID, tap Generate Code. The agent must read the code back to you - if they can't, hang up immediately.", style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),),

                ) : const SizedBox(),

              (!show) ?  Container(
                margin: const EdgeInsets.only(top: 30),
                child: DottedBorder(
                  color: Colors.grey.shade300, // Color del borde
                  strokeWidth: 2,               // Grosor de los puntos
                  dashPattern: [6, 3],          // [Largo del punto, Espacio entre puntos]
                  borderType: BorderType.RRect, // Borde redondeado
                  radius: const Radius.circular(16),  // Curvatura de las esquinas
                  child: Container(
                    height: 120,                // Ajusta según necesites
                    width: double.infinity,     // Ocupa todo el ancho
                    decoration: BoxDecoration(
                      color: Colors.transparent, 
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Code will appear here\nafter you tap Generate',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ) : const SizedBox(),
                
                // InkWell(
                //   onTap: (){
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => const ReportForm()),
                //     );

                //   },
                //   child:  
                //   Container(                    
                //     margin: const EdgeInsets.only(top: 15),
                //     child: const Text("Did you receive a fraudulent call? Report it here.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),)),
                // ),

                show ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   
                    Container(
                      margin: const EdgeInsets.only(right: 25, top: 20, bottom: 10),
                      child: const Text("ONE-TIME VERIFICATION CODE", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),)),
                     Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey
                          ),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(15.0) //                 <--- border radius here
                          ),

                        ),
                       child: Column(
                         children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 20, top: 25),
                            child:  Text(code.toString(), style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                          ),
                           Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 20),
                            child: const Text("Wait for the agent to read this back to you", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),)),
                            
                           
                           Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 15),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text("Expires in", style: TextStyle(fontSize: 12),),
                                ),
                                SlideCountdownSeparated(     
                                  key: _countdownKey,     
                                  decoration: BoxDecoration(color: Colors.transparent),   
                                  style: TextStyle(color: Colors.black),         
                                  duration: Duration(minutes: 10),
                                  
                                ),
                              ],
                            ),
                          ),
                         ],
                       ),
                     ),

                    Container(
                      width: w,
                      margin: const EdgeInsets.only(top: 25),
                      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 234, 230),
                        border: Border.all(color: Color.fromARGB(255, 223, 88, 76)),
                      
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0) //                 <--- border radius here
                      ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(Icons.info, color: Color.fromARGB(255, 166, 19, 0),),
                              Container(
                                  width: w-100,
                                  child: const Text("Do not read this code to the agent. A real Sunset World agent will read it back to you - you never say it first", 
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 166, 19, 0)),)),
                            ],
                          ),
                          // const Text("Already share with the agent", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),),
                        ],
                      ),
                    ) 
                 ],
               ) : const SizedBox(),
              !(show) ?  Container(
                margin: const EdgeInsets.only(top: 35, right: 5),
                child: InkWell(
                  onTap: () async {

                    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                    code= String.fromCharCodes(Iterable.generate(
                        8, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));
                    setState(() {
                      show = !show;
                      code = code;
                      _countdownKey = UniqueKey();
                    });

                    await db.guardarDatosRegistro(widget.userData?.data.contracts.first.contractId.toString() ?? "", code);
                  },
                  child: Container(
                    width: w,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(                      
                          Radius.circular(10.0) //         <--- border radius here
                      ),
                    ),
                    child: const Text(
                      "Generate Code",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ): Container(
                margin: const EdgeInsets.only(top: 35, right: 5),
                child: InkWell(
                  onTap: () async {

                    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                    code= String.fromCharCodes(Iterable.generate(
                        8, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));
                    setState(() {                     
                      code = code;
                      _countdownKey = UniqueKey();
                    });


                    await db.guardarDatosRegistro(widget.userData?.data.contracts.first.contractId.toString() ?? "", code);
                    
                  },
                  child: Container(
                    width: w,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(                      
                          Radius.circular(10.0) //         <--- border radius here
                      ),
                    ),
                    child: const Text(
                      "Generate new code",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
              
              ],
            ),
          )
        ]),
      ),
    );
  }
}