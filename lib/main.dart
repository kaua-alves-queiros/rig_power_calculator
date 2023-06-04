import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rig_power_calculator/application.dart';

void main() async {
  await GetStorage.init();
  runApp(const Application());
}
