import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:legitcaller/perfil/perfilPage.dart';
import 'package:legitcaller/registro/stepsPage.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final TextEditingController _code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Onboarding", style: TextStyle(fontSize: 18, color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 25, top: 15),
            child: Text("Invitation Code", style: TextStyle(fontSize: 16),),
          ),
          Container(
             alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 25, right: 30),
            child: TextFormField(
              controller: _code,
            
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 25, top: 5),
            child: Text("You can also scan QR code", style: TextStyle(fontSize: 12),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: InkWell(
                  onTap: () async {
                    var result = await BarcodeScanner.scan();

                    // if(result.rawContent.isNotEmpty){
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => PerfilPage()),
                    //   );
                    // }else{
                    //   return;
                    // }
                  },
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius:const BorderRadius.all(                      
                          Radius.circular(10.0) //         <--- border radius here
                      ),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Text(
                      "Scan QR Code",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: InkWell(
                  onTap: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => PerfilPage()),
                    // );
                  },
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(                      
                          Radius.circular(10.0) //         <--- border radius here
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              
            ],
          ),

           Container(
            margin: EdgeInsets.only(top: 65),
            child: InkWell(
              onTap: () async {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StepsGuide()),
                  );
              },
              child: Container(
                width: 180,
                padding: const EdgeInsets.all(10),
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius:const BorderRadius.all(                      
                      Radius.circular(10.0) //         <--- border radius here
                  ),
                  border: Border.all(color: Colors.black, width: 0),
                ),
                child: const Text(
                  "Step by Step Guide",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}