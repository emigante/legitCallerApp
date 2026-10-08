import 'dart:async';

import 'package:flutter/material.dart';
import 'package:legitcaller/splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simula una carga de 3 segundos antes de navegar a la pantalla principal
    Timer(const Duration(seconds: 3), () {
      // Reemplaza 'HomeScreen()' con la pantalla de inicio de tu app
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Splash()), 
      );
    });
  }

  double w=0, h=0;


  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        // Fondo con un sutil degradado de azul muy claro a blanco
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD), // Azul muy claro
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Logotipo centrado
             // Reemplaza el Container del logo por este widget vectorizado:
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFE1F5FE).withOpacity(0.7),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.08),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(0, 8),
                  ),
                  ],
                ),
                child: Image.asset("assets/images/logosinfondo.png"),
                
              ),
              // Indicador de carga y texto en la parte inferior
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0288D1)), // Azul del logo
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Cargando...',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF01579B).withOpacity(0.8), // Texto azul oscuro
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}