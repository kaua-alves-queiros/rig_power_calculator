import 'package:flutter/material.dart';

import '../controller/home.dart';
import 'device_editor.dart';

class DeviceWidget extends StatelessWidget {
  HomeController controller;
  int index;

  DeviceWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.devices[index].name),
                  PopupMenuButton<int>(
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem<int>(
                        value: 2,
                        child: Text('Delete'),
                      ),
                    ],
                    onSelected: (int value) {
                      if (value == 1) {
                        DeviceEditor.showDialog(
                          deviceToEdit: controller.devices[index],
                          onDevice: (device) {
                            controller.editDevice(index, device);
                          },
                        );
                      }

                      if (value == 2) {
                        controller.deleteDevice(index);
                      }
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Text('Whatts Per Unit: '),
                      Text(controller.devices[index].whatts.toString()),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Text('Quantity: '),
                      Text(controller.devices[index].quatity.toString()),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Text('Total Whats: '),
                      Text((controller.devices[index].whatts *
                              controller.devices[index].quatity)
                          .toString()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
