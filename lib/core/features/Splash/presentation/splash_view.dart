import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/features/Splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(131, 24, 64, 71),
      body: SplashViewBody(),
    );
  }
}
