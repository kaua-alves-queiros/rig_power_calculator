import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/device.dart';

class DeviceEditor {
  static void showDialog({
    required void Function(DeviceModel device) onDevice,
    DeviceModel? deviceToEdit,
  }) {
    var formKey = GlobalKey<FormState>();

    TextEditingController nameController = TextEditingController(
      text: deviceToEdit != null ? deviceToEdit.name : '',
    );

    TextEditingController wattsController = TextEditingController(
      text: deviceToEdit != null ? deviceToEdit.whatts.toString() : '',
    );

    TextEditingController quantityController = TextEditingController(
      text: deviceToEdit != null ? deviceToEdit.quatity.toString() : '',
    );

    Get.dialog(
      AlertDialog(
        title: Text(deviceToEdit == null
            ? 'Add A Device'
            : 'Edit ${nameController.value.text}'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                validator: (name) {
                  if (name!.isEmpty) {
                    return 'Name Is Empty';
                  }

                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
              ),
              TextFormField(
                controller: wattsController,
                keyboardType: TextInputType.number,
                validator: (whatts) {
                  if (whatts!.isEmpty) {
                    return 'Whatts Is Empty';
                  }

                  try {
                    double doubleWhatts = double.parse(whatts);

                    if (doubleWhatts <= 0) {
                      return 'Minimun Whatts is 1';
                    }
                  } catch (_) {
                    return "The 'Whatts' field needs to be numeric";
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Whatts'),
                ),
              ),
              TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                ),
                validator: (quantity) {
                  if (quantity!.isEmpty) {
                    return 'Quantity is empty';
                  }

                  try {
                    int intQuantity = int.parse(quantity);

                    if (intQuantity <= 0) {
                      return 'Minimum Quantity is 1';
                    }
                  } catch (_) {
                    return "The 'Quantity' field needs to be numeric";
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Get.back();
            },
          ),
          ElevatedButton(
            child: const Text('Save'),
            onPressed: () {
              bool isValid = formKey.currentState!.validate();

              if (isValid) {
                DeviceModel deviceInEdition = DeviceModel(
                  name: nameController.text,
                  whatts: double.parse(wattsController.text),
                  quatity: int.parse(quantityController.text),
                );

                onDevice(deviceInEdition);

                Get.back();
              }
            },
          ),
        ],
      ),
    );
  }
}
