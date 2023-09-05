import 'package:en_words/data/get_x/api_get_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DictionaryScreen extends StatelessWidget {
  final DictionaryController dictionaryController = Get.find();

  DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(26.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Definition',
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    onChanged: (value) {
                      dictionaryController.word.value = value;
                    },
                ),
                ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(Colors.green),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {
                  final word = dictionaryController.word.value;
                  if (word.isNotEmpty) {
                    dictionaryController.getWordDefinition(context);
                  }
                },
                child: const Text('Search',style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
            const SizedBox(height: 30,),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Definition: ${dictionaryController.definition.value}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}