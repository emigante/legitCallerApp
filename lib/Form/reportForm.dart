import 'package:flutter/material.dart';
import 'package:legitcaller/perfil/perfilPage.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  TextEditingController _descrip = TextEditingController();
  TextEditingController _number = TextEditingController();
  double w = 0,h=0;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Report"),
      ),
      body: SingleChildScrollView(
      
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  "Telephone number that made the call",
                  style: TextStyle(fontSize: 18),
                )),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    //labelText: "Reporte",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3,
                          color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3,
                          color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    )                 
                  ),
                controller: _number,
              ),
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  "Describe the situation",
                  style: TextStyle(fontSize: 18),
                )),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    //labelText: "Reporte",
                    enabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide(
                          width: 3,
                          color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:const BorderSide(
                          width: 3,
                          color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    )                 
                  ),
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                controller: _descrip,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 35, right: 25, left: 25),
                child: InkWell(
                  onTap: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const PerfilPage()),
                    // );

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
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),)
            
          ],
        ),
      ),
    );
  }
}