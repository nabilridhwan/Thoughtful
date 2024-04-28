import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_mobile_project/repository/Prompt.dart';

class PromptsCubit extends Cubit<List<Prompt>>{
  PromptsCubit() : super([]);

  void getAllPrompts() async {

  //   Parse JSON prompts.json
    var prompts = await rootBundle.loadString('assets/prompts.json');
    var promptList = json.decode(prompts);

    List<Prompt> promptListObject = [];

    for (var prompt in promptList) {
      promptListObject.add(Prompt.fromJson(prompt));
    }

    log(promptListObject.toString());


    emit(promptListObject);
  }
}