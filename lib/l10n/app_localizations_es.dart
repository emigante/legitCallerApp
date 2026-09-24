// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get antesCompartir => 'Comprueba quién te está llamando realmente';

  @override
  String get antesCompartir_sub =>
      'Antes de compartir cualquier información, utiliza esta aplicación para confirmar que la persona que llama es realmente de Sunset World.';

  @override
  String get punto1 =>
      'Facilita tu número de identificación permanente al inicio de la llamada';

  @override
  String get punto2 =>
      'Genera un código de un solo uso y espera a que el agente te lo repita';

  @override
  String get punto3 => 'Si no pueden confirmarlo, cuelga inmediatamente';

  @override
  String get empezar => 'Empezar';

  @override
  String get antifraude => 'Protección antifraude';

  @override
  String get ingresar => 'Iniciar sesión';

  @override
  String get ingresar_sub => 'Accede a tu perfil de verificación';
}
