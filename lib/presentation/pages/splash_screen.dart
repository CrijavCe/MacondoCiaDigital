import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minimal/shared/assets/assets.dart';

class SplashScreen extends StatelessWidget {
  static const String name = 'splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      // ignore: use_build_context_synchronously
      context.go('/home');
    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Image.asset(
              Res.images.splashGeneric,
              fit: BoxFit.cover,
              width: size.width * 0.5,
              height: size.height * 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
