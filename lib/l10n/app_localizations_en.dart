// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get antesCompartir => 'Verify who\'s really calling you';

  @override
  String get antesCompartir_sub =>
      'Before sharing any information, use this app to confirm the caller is genuinely, from Sunset World';

  @override
  String get punto1 => 'Share your permanents ID when the call begins';

  @override
  String get punto2 =>
      'Generate a one-time code and wait for the agent to read it back to you';

  @override
  String get punto3 => 'If they can\'t confirm it, hang up immediately';

  @override
  String get empezar => 'Get started';

  @override
  String get antifraude => 'Anti-fraud protection';

  @override
  String get ingresar => 'Sign in';

  @override
  String get ingresar_sub => 'Access your verification profile';
}
