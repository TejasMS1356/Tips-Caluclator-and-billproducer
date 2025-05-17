import 'package:flutter/material.dart';
import 'package:tip_caluclator/tip_calucltaor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext) {
    return const MaterialApp(home: TipCalucltaor());
  }
}
