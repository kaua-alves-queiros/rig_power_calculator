import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rig_power_calculator/model/device.dart';

class HomeController extends GetxController {
  RxList<Device> devices = List<Device>.empty().obs;
  final _storage = GetStorage();

  HomeController() {
    loadStorate();
  }

  void addDevice(Device device) {
    devices.add(device);
    updateStorate();
    loadStorate();
  }

  void deleteDevice(int index) {
    devices.removeAt(index);
    updateStorate();
    loadStorate();
  }

  void editDevice(int index, Device device) {
    devices[index] = device;
    updateStorate();
    loadStorate();
  }

  void loadStorate() {
    List<Map<String, dynamic>> _devices =
        List<Map<String, dynamic>>.from(_storage.read('devices') ?? []);

    devices.value = _devices.map((device) => Device.fromMap(device)).toList();
  }

  double get totalWatts {
    double total = 0;

    for (var device in devices) {
      total += device.whatts * device.quatity;
    }

    return total;
  }

  void updateStorate() async {
    _storage.write('devices', devices.map((device) => device.toMap()).toList());
  }
}
