import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rig_power_calculator/model/device.dart';
import 'package:rig_power_calculator/model/rig.dart';
import 'package:rig_power_calculator/storage/Rigs.dart';
import 'package:uuid/uuid.dart';

import '../controller/rig.dart';

class RigsPage extends GetView<RigsController> {
  static const route = '/rigs';

  const RigsPage({
    super.key,
  });

  void addRigOnPressed() {
    String generatedId = const Uuid().v4().substring(0, 4);

    RigsStorage.add(
        RigModel(id: generatedId, devices: List<DeviceModel>.empty()));

    controller.loadRigs();

    showCreatedDialog(generatedId);
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

  void showRemoveRigDialog(String id) {
    Get.dialog(
      AlertDialog(
        title: Text('Are you sure you want to remove the rig [$id] ? '),
        actions: [
          ElevatedButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.deleteRig(id);
              Get.back();
            },
            child: const Text('Delete'),
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
        onPressed: addRigOnPressed,
        child: const Icon(Icons.add),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.rigs!.value.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.rigs!.value[index].id),
                      PopupMenuButton(
                        itemBuilder: (_) => [
                          const PopupMenuItem(
                            value: 1,
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 2,
                            child: Text('Delete'),
                          ),
                        ],
                        onSelected: (value) {
                          String rigId = controller.rigs!.value[index].id;

                          if (value == 1) {
                            controller.editRig(rigId);
                          }

                          if (value == 2) {
                            showRemoveRigDialog(rigId);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
