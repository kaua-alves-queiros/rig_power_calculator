import 'package:get_storage/get_storage.dart';
import 'package:rig_power_calculator/model/rig.dart';

class RigsStorage {
  static final _storage = GetStorage();

  static List<RigModel> all() {
    List<Map<String, dynamic>> rigs =
        List<Map<String, dynamic>>.from(_storage.read('rigs') ?? []);

    return rigs.map((device) => RigModel.fromMap(device)).toList();
  }

  static void add(RigModel rig) {
    List<RigModel> rigs = all();

    rigs.add(rig);

    _save(rigs);
  }

  static void removeById(String id) {
    List<RigModel> rigs = all();

    RigModel rigToRemove = rigs.where((rig) => rig.id == id).first;

    rigs.remove(rigToRemove);

    _save(rigs);
  }

  static void _save(List<RigModel> rigs) {
    _storage.write('rigs', rigs.map((device) => device.toMap()).toList());
  }
}
