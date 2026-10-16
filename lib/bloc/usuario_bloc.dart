class UsuarioBloc {
  UsuarioBloc._internal();

  static final UsuarioBloc _singleton = UsuarioBloc._internal();
  factory UsuarioBloc() => _singleton;

  String? emailSoporte;
  int? tiempoCodigo;
}