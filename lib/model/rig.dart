import 'device.dart';

class RigModel {
  String id;
  List<DeviceModel> devices;

  RigModel({
    required this.id,
    required this.devices,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'devices': devices.map((x) => x.toMap()).toList(),
    };
  }

  factory RigModel.fromMap(Map<String, dynamic> map) {
    return RigModel(
      id: map['id'] as String,
      devices: List<DeviceModel>.from(
        (List<Map<String, dynamic>>.from(map['devices'])).map<DeviceModel>(
          (x) => DeviceModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
