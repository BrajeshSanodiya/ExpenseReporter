import 'dart:async';

import 'package:expense_reporter/widgets/expenses.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.txtVersion});
  final String txtVersion;
  //final double progressValue;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initTimer();
  }

  void initTimer() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Expenses())));
  }

  @override
  Widget build(BuildContext context) {
    print("Height of screen = ${MediaQuery.of(context).size.height}");
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/images/bg.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
                  fit: BoxFit
                      .fill), // child: Image.asset('assets/images/bg.png', fit: BoxFit.fill),
            ),
            Center(
              child: Image.asset('assets/images/app_logo.png'),
            ),
            Positioned(
                right: MediaQuery.of(context).size.width * 0.18,
                bottom: MediaQuery.of(context).size.height * 0.10,
                child: const Text(
                  'Expense Reporter',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                )),
            Positioned(
              right: 20,
              bottom: 12,
              child: Text(
                widget.txtVersion,
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
            // Positioned(
            //   bottom: 50,
            //   left: MediaQuery.of(context).size.width / 2.1,
            //   child: const Center(
            //     child: CircularProgressIndicator(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
