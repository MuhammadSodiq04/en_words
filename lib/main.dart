import 'package:en_words/data/get_x/api_get_x.dart';
import 'package:en_words/ui/definition_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DictionaryController());
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DictionaryScreen()
    );
  }
}
