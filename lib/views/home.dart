import 'dart:async';
import 'package:digital_clock/views/custome_view.dart/lcd_led.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var n = ' ';

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (context.mounted) {
        setState(() {
          var now = DateTime.now();
          n = DateFormat('kk:mm:ss').format(now);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: lcdClock(),
      ),
    );
  }

  Widget lcdClock() {
    return SizedBox(
      height: 70,
      child: AspectRatio(
          aspectRatio: n.length.toDouble() / 1.5,
          child: Center(
            child: LedDigits(
              string: n,
              spacing: 12,
              numberOfLeds: n.length,
              onColor: const Color(0xFF171717),
              backgroundColor: Colors.transparent,
              offColor: const Color(0xFFE6E6E6),
            ),
          )),
    );
  }
}
