import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:legitcaller/bloc/usuario_bloc.dart';
import 'package:legitcaller/conection/conection.dart';
import 'package:legitcaller/login/loginPage.dart';
import 'package:legitcaller/models/userData.dart';
import 'package:legitcaller/provider/loadingProvider.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:legitcaller/l10n/app_localizations.dart';

class PerfilPage extends StatefulWidget {
  final UserData? userData;
  const PerfilPage({super.key, required this.userData});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool show = false;
  String code = "";
  Key _countdownKey = UniqueKey();
  DatabaseServices db = DatabaseServices();
  late DateTime _endTime;
  UsuarioBloc _usuarioBloc = UsuarioBloc();

  Duration get _remainingDuration {
    final remaining = _endTime.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }

  void _generateNewCode() async {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String generatedCode = String.fromCharCodes(
      Iterable.generate(8, (_) => chars.codeUnitAt(Random().nextInt(chars.length))),
    );

    var exp = await db.guardarDatosRegistro(
      widget.userData?.data.contracts.first.contractId.toString() ?? "",
      generatedCode,
    );

    setState(() {
      show = true;
      code = generatedCode;
      _countdownKey = UniqueKey();
      _endTime = exp;
    });
  }

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER BAR ---
               IconButton(
                    onPressed: () {
                      Provider.of<LoadingProvider>(context, listen: false).setLoad(true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                      Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
                    },
                    icon: const Icon(Icons.power_settings_new, color: Color(0xFF334155)),
                  ),

              const SizedBox(height: 24),

              // --- USER GREETING & STATUS ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFF1E293B),
                        child: Icon(Icons.call, color: Colors.white,)
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           AppLocalizations.of(context)!.bienvenido,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.caller_verification,
                            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE0F2FE),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.verified_user_rounded, size: 20, color: primaryColor),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // --- SECTION TITLE ---
              
              const SizedBox(height: 6),
              Text(
                AppLocalizations.of(context)!.next_code,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0F172A),
                ),
              ),
              // const SizedBox(height: 6),
              // const Text(
              //   "Diez minutos para usarlo.\nUn toque para generarlo.",
              //   style: TextStyle(
              //     fontSize: 14,
              //     height: 1.4,
              //     color: Color(0xFF475569),
              //   ),
              // ),

              const SizedBox(height: 24),

              // --- MAIN CARD (CODE DISPLAY OR DOTTED PLACEHOLDER) ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF64748B).withOpacity(0.06),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.id_permanente.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            show ? AppLocalizations.of(context)!.activo : AppLocalizations.of(context)!.sin_generar,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF475569),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Text(
                          AppLocalizations.of(context)!.mencionar_id,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF64748B)
                          ),
                        ),
                      ),

                    // MEMBERSHIP ID / PERMANENT ID DISPLAY
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          
                          
                          Text(
                            widget.userData?.data.contracts.first.membership.toString() ?? "",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // CÓDIGO TEMPORAL O DASHED BOX
                    if (!show) ...[
                      DottedBorder(
                        color: const Color(0xFFCBD5E1),
                        strokeWidth: 1.5,
                        dashPattern: const [6, 4],
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(16),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.codigo_aparecera,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      Center(
                        child: Text(
                          code,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4.0,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.copy_rounded, size: 14, color: Color(0xFF64748B)),
                            const SizedBox(width: 4),
                            Container(
                              width: (MediaQuery.of(context).size.width)/2,
                              child: Text(
                                "${AppLocalizations.of(context)!.esperar_agente}  ${_usuarioBloc.emailSoporte}",
                                style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.expira_en,
                            style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                          ),
                          SlideCountdownSeparated(
                            key: ValueKey(_endTime),
                            decoration: const BoxDecoration(color: Colors.transparent),
                            style: const TextStyle(
                              color: Color(0xFF0F172A),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            duration: _remainingDuration,
                            onDone: () {
                              // Aquí ejecutas la lógica cuando el contador termine
                              print('El tiempo ha finalizado');
                              setState(() {
                                show = false;
                                code = "";
                                _countdownKey = UniqueKey();
                                //_endTime = null;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(4),
                      //   child: LinearProgressIndicator(
                      //     value: 0.8,
                      //     backgroundColor: const Color(0xFFE2E8F0),
                      //     valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      //     minHeight: 4,
                      //   ),
                      // ),
                    ],

                    const SizedBox(height: 20),

                    // ACTION BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () => _confirmar(),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              show
                                  ? AppLocalizations.of(context)!.generar_codigo_nuevo
                                  : AppLocalizations.of(context)!.generar_codigo,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              
            ],
          ),
        ),
      ),
    );
  }


  void _confirmar() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.no_compartir),
          content: Text(AppLocalizations.of(context)!.recuerde),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancelar", style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () async {
                _generateNewCode();
                Navigator.of(context).pop();
              },
              child: const Text("Aceptar", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
