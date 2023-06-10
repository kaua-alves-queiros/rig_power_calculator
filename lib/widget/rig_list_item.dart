// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rig_power_calculator/controller/rig.dart';

class RigListItem extends GetView<RigsController> {
  final int index;

  const RigListItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<RigsController>();

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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('id: ${controller.rigs!.value[index].id}'),
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
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                          'Devices: ${controller.rigs!.value[index].devices.length}'),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
