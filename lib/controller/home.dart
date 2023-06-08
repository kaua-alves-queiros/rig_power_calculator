import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rig_power_calculator/model/device.dart';

class HomeController extends GetxController {
  RxList<DeviceModel> devices = List<DeviceModel>.empty().obs;
  final _storage = GetStorage();

  HomeController() {
    loadStorate();
  }

  void addDevice(DeviceModel device) {
    devices.add(device);
    updateStorate();
    loadStorate();
  }

  void deleteDevice(int index) {
    devices.removeAt(index);
    updateStorate();
    loadStorate();
  }

  void editDevice(int index, DeviceModel device) {
    devices[index] = device;
    updateStorate();
    loadStorate();
  }

  void loadStorate() {
    List<Map<String, dynamic>> _devices =
        List<Map<String, dynamic>>.from(_storage.read('devices') ?? []);

    devices.value =
        _devices.map((device) => DeviceModel.fromMap(device)).toList();
  }

  int get totalWatts {
    int total = 0;

    for (var device in devices) {
      total += device.whatts * device.quatity;
    }

    return total;
  }

  void updateStorate() async {
    _storage.write('devices', devices.map((device) => device.toMap()).toList());
  }
}
