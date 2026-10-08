import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legitcaller/l10n/app_localizations.dart';
import 'package:legitcaller/login/loginPage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF21A6EA);
    final backgroundColor = const Color(0xFFF8FAFC);
    final cardColor = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // --- BADGE ANTIFRAUDE ---
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F2FE),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: primaryColor.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shield_rounded, size: 16, color: primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.antifraude,
                      style: TextStyle(
                        fontSize: 13,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // --- TÍTULOS PRINCIPALES ---
              Text(
                AppLocalizations.of(context)!.antesCompartir,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context)!.antesCompartir_sub,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 32),

              // --- LISTA DE PASOS (CARDS) ---
              _buildStepCard(
                context,
                stepNumber: "01",
                text: AppLocalizations.of(context)!.punto1,
                icon: Icons.badge_outlined,
                cardColor: cardColor,
                primaryColor: primaryColor,
              ),
              const SizedBox(height: 14),

              _buildStepCard(
                context,
                stepNumber: "02",
                text: AppLocalizations.of(context)!.punto2,
                icon: Icons.key_rounded,
                cardColor: cardColor,
                primaryColor: primaryColor,
              ),
              const SizedBox(height: 14),

              _buildStepCard(
                context,
                stepNumber: "03",
                text: AppLocalizations.of(context)!.punto3,
                icon: Icons.phone_disabled_rounded,
                cardColor: cardColor,
                primaryColor: primaryColor,
              ),

              const SizedBox(height: 40),

              // --- BOTÓN PRINCIPAL "EMPEZAR" ---
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color(0xFF1D88E5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadowColor: primaryColor.withOpacity(0.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.empezar,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET REUTILIZABLE PARA CADA CARD DE PASO
  Widget _buildStepCard(
    BuildContext context, {
    required String stepNumber,
    required String text,
    required IconData icon,
    required Color cardColor,
    required Color primaryColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64748B).withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Center(
              child: Icon(icon, color: primaryColor, size: 22),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}