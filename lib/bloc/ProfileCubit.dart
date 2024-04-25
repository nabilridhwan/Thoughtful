import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCubit extends Cubit<String?>{
  ProfileCubit(): super(null);

  Future<void> setName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('Setting name to $name');
    await prefs.setString('name', name);
    emit(name);
  }

  Future<void> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = await prefs.getString('name');
    log('Got name: $name');
    emit(name);
  }

}