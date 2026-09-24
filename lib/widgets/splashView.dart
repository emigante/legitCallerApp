import 'package:flutter/material.dart';
import 'package:legitcaller/provider/loadingProvider.dart';
import 'package:provider/provider.dart';


class LoadingScreen {
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, LoadingCustom(child: child!));
      } else {
        return LoadingCustom(child: child!);
      }
    };
  }
}

class LoadingCustom extends StatefulWidget {
  final Widget child;
  const LoadingCustom({Key? key, required this.child}) : super(key: key);

  @override
  State<LoadingCustom> createState() => _LoadingCustomState();
}

class _LoadingCustomState extends State<LoadingCustom> {
  late double w, h;
  bool alerta = false;
  String msAlerta = "";

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ChangeNotifierProvider<LoadingProvider>(
            create: (context) => LoadingProvider(),
            builder: (context, _) {
              return Stack(children: [
                 GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus( FocusNode());
                    },
                    child: widget.child),
                Consumer<LoadingProvider>(builder: (context, provider, child) {
                  return provider.loading
                      ? Container(
                          width: w,
                          height: h,
                          color: const Color.fromARGB(146, 0, 0, 0),
                          child: Center(
                              child: Image.asset(
                            "assets/icon/carga.gif",
                            width: 200,
                            height: 200,
                            fit: BoxFit.contain,
                          )),
                        )
                      : const SizedBox();
                })
              ]);
            }));
  }  
}
