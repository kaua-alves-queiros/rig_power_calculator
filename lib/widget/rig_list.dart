import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rig_power_calculator/widget/rig_list_item.dart';

import '../controller/rig.dart';

class RigList extends GetView<RigsController> {
  const RigList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<RigsController>();

    return Obx(
      () => ListView.builder(
        itemCount: controller.rigs!.value.length,
        itemBuilder: (_, index) => RigListItem(index: index),
      ),
    );
  }
}
