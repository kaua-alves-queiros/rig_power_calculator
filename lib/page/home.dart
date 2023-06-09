import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rig_power_calculator/controller/home.dart';
import 'package:rig_power_calculator/widget/device.dart';
import 'package:rig_power_calculator/widget/device_editor.dart';

class HomePage extends GetView<HomeController> {
  static const String route = '/home';

  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rig Power Calculator'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DeviceEditor.showDialog(
            onDevice: (device) {
              controller.addDevice(device);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              controller.totalWatts > 0
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('Total Whatts: ${controller.totalWatts}'),
                    )
                  : const Column(),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: controller.devices.length,
                itemBuilder: (_, index) => DeviceWidget(
                  index: index,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
