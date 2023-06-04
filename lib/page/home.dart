import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rig_power_calculator/controller/home.dart';
import 'package:rig_power_calculator/model/device.dart';

class HomePage extends GetView {
  static const String route = '/home';
  @override
  final HomeController controller = Get.put(HomeController());

  HomePage({
    super.key,
  });

  void showDeviceEditorDialog({
    int? index,
  }) {
    var formKey = GlobalKey<FormState>();

    TextEditingController nameController = TextEditingController(
      text: index != null ? controller.devices[index!].name : '',
    );

    TextEditingController wattsController = TextEditingController(
      text: index != null ? controller.devices[index].whatts.toString() : '',
    );

    TextEditingController quantityController = TextEditingController(
      text: index != null ? controller.devices[index].quatity.toString() : '',
    );

    Get.dialog(
      AlertDialog(
        title: Text(index == null
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
                Device deviceInEdition = Device(
                  name: nameController.text,
                  whatts: double.parse(wattsController.text),
                  quatity: int.parse(quantityController.text),
                );

                if (index == null) {
                  controller.addDevice(
                    deviceInEdition,
                  );
                } else {
                  controller.editDevice(index, deviceInEdition);
                }

                Get.back();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Rig Power Calculator'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showDeviceEditorDialog,
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
                  itemBuilder: (_, index) => Padding(
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
                                    const PopupMenuDivider(),
                                    const PopupMenuItem<int>(
                                      value: 2,
                                      child: Text('Delete'),
                                    ),
                                  ],
                                  onSelected: (int value) {
                                    if (value == 1) {
                                      showDeviceEditorDialog(index: index);
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
                                    Text(controller.devices[index].whatts
                                        .toString()),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    const Text('Quantity: '),
                                    Text(controller.devices[index].quatity
                                        .toString()),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
