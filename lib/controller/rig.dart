import 'package:get/get.dart';

import '../model/rig.dart';
import '../storage/rigs.dart';

class RigsController extends GetxController {
  Rx<List<RigModel>>? rigs;

  void loadRigs() {
    rigs ??= Rx(List<RigModel>.empty());

    rigs!.value = RigsStorage.all();
  }

  void editRig(String id) {}

  void deleteRig(String id) {
    RigsStorage.removeById(id);
    loadRigs();
  }
}
