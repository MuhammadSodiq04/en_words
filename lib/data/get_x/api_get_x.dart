import 'dart:convert';

import 'package:en_words/utils/ui_utils/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DictionaryController extends GetxController {
  var definition = ''.obs;
  var word = ''.obs;

  Future<void> getWordDefinition(BuildContext context) async {
    showLoading(context: context);
    final response = await http.get(Uri.parse(
        'https://api.dictionaryapi.dev/api/v2/entries/en/${word.value}'));
    if (context.mounted) hideLoading(context: context);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final firstEntry = jsonData[0];
      final meanings = firstEntry['meanings'] as List<dynamic>;
      if (meanings.isNotEmpty) {
        final definitionText = meanings[0]['definitions'][0]['definition'];
        definition.value = definitionText;
      } else {
        definition.value = 'Definition not found.';
      }
    } else {
      definition.value = 'Word not found.';
    }
  }
}
