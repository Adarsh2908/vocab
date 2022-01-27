import 'package:flutter/material.dart';
import 'loggercheck.dart';
void main() {
  runApp(VocabMaster());
}

class VocabMaster extends StatelessWidget{
  // Title
  static const String title = "Vocab Master";
  @override
  Widget build(BuildContext context )  => const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home: LoggerCheck(),
  );
}