import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rig_power_calculator/page/home.dart';
import 'package:rig_power_calculator/page/rigs.dart';

class Application extends StatelessWidget {
  const Application({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rig Power Calculator',
      initialRoute: RigsPage.route,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      getPages: [
        GetPage(
          name: HomePage.route,
          page: () => const HomePage(),
        ),
        GetPage(
          name: RigsPage.route,
          page: () => const RigsPage(),
        ),
      ],
    );
  }
}
