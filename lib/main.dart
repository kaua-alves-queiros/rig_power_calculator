import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rig_power_calculator/application.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const Application());
}
