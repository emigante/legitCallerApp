import 'package:flutter/material.dart';

class StepsGuide extends StatefulWidget {
  const StepsGuide({super.key});

  @override
  State<StepsGuide> createState() => _StepsGuideState();
}

class _StepsGuideState extends State<StepsGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Step by Step Guide")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: const Icon(Icons.qr_code, size: 35,),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Step 1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Enter or scan your invitation code"),
                  ],)
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: const Icon(Icons.follow_the_signs_rounded, size: 35,),
                  ),
                  Container(
                    width: 250,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Step 2", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Follow the prompts to complete registration"),
                    ],),
                  )
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: const Icon(Icons.check_circle, size: 35,),
                  ),
                  Container(
                    width: 250,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Step 3", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Start using our services!"),
                    ],),
                  )
                ],
              )
            ),


          ],
        ),
      ),
    );
  }
}