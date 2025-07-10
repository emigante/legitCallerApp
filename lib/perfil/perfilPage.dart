import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  double w = 0,h=0;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Caller verification"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 25),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Your unique ID", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const Text("Only share this ID with the caller NOTHING ELSE", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text("Unique ID", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),)),
                const Text("ABC12345", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                Container(
                margin: const EdgeInsets.only(top: 35, right: 25),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PerfilPage()),
                    );
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
                      "Generate OTP Code",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
               Container(
                margin: EdgeInsets.only(top: 25),
                child: Text("Your OTP Code", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                Container(
                  margin: EdgeInsets.only(right: 25),
                  child: Text("Wait the caller repeat this number to you. DONT SHARE IT with the caller", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),)),
                 Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text("One time validation code", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),)),
                Text("ABC12345", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              ],
            ),
          )
        ]),
      ),
    );
  }
}