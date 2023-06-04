import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rig_power_calculator/page/home.dart';

class Application extends StatelessWidget {
  const Application({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: HomePage.route,
      getPages: [
        GetPage(
          name: HomePage.route,
          page: () => HomePage(),
        ),
      ],
    );
  }
}
