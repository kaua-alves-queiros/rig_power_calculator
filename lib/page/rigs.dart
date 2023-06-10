import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rig_power_calculator/model/device.dart';
import 'package:rig_power_calculator/model/rig.dart';
import 'package:rig_power_calculator/storage/rigs.dart';
import 'package:rig_power_calculator/widget/rig_list.dart';
import 'package:uuid/uuid.dart';

import '../controller/rig.dart';

class RigsPage extends GetView<RigsController> {
  static const route = '/rigs';

  const RigsPage({
    super.key,
  });

  void addRigOnPressed() {
    Get.back();

    String generatedId = const Uuid().v4().substring(0, 4);

    RigsStorage.add(
        RigModel(id: generatedId, devices: List<DeviceModel>.empty()));

    controller.loadRigs();

    showCreatedDialog(generatedId);
  }

  void showAddRigDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Add Rig'),
        actions: [
          ElevatedButton(
            onPressed: Get.back,
            child: const Text('cancel'),
          ),
          ElevatedButton(
            onPressed: addRigOnPressed,
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void showCreatedDialog(String createdRigId) {
    Get.dialog(
      AlertDialog(
        title: Text('Rig $createdRigId has been successfully created'),
        actions: [
          ElevatedButton(
            onPressed: () => controller.editRig(createdRigId),
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put<RigsController>(RigsController());

    if (controller.rigs == null) {
      controller.loadRigs();
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showAddRigDialog,
        child: const Icon(Icons.add),
      ),
      body: const RigList(),
    );
  }
}
