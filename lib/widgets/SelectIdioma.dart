import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legitcaller/provider/LocalProvider.dart';
// import 'package:origins/bloc/usuario_bloc.dart';
// import 'package:origins/provider/LocalProvider.dart';
import 'package:provider/provider.dart';

class Salectidioma extends StatefulWidget {
  const Salectidioma({super.key});

  @override
  State<Salectidioma> createState() => _SalectidiomaState();
}

class _SalectidiomaState extends State<Salectidioma> {
  
  // UsuarioBloc _usuarioBloc = new UsuarioBloc();
  
    TextStyle style =const TextStyle(fontSize: 18, color: Colors.white);
    TextStyle style2 =const TextStyle(fontSize: 18, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleProvider>().locale;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const Text(
            "Idioma:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        PopupMenuButton<String>(
          style: const ButtonStyle(elevation: WidgetStatePropertyAll<double>(10)),
          child: Container(
            decoration: BoxDecoration(
               color: Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
           
            width: 150,
            child: Row(
              children: [
                const Icon(Icons.language, color: Colors.white,),
                Text(
                  locale?.languageCode == "es" ? "Español" : "English",
                  style: style,
                )
              ],
            ),
          ),
          onSelected: (value) {
            final provider =
                Provider.of<LocaleProvider>(context, listen: false);
            if (value == 'es') {
              provider.setLocale(const Locale('es'));
            } else if (value == 'en') {
              provider.setLocale(const Locale('en'));
            }
          },
          itemBuilder: (context) => [
             PopupMenuItem(
              value: 'en',
              child: Text(
                'English',
                style: style2,
              ),
            ),
             PopupMenuItem(
              value: 'es',
              child: Text(
                'Español',
                style: style2,
              ),
            ),
          ],
        )
      ],
    ),
    );
  }
}
