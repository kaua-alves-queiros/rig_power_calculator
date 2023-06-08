class DeviceModel {
  String name;
  double whatts;
  int quatity;

  DeviceModel({
    required this.name,
    required this.whatts,
    required this.quatity,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'whatts': whatts,
      'quatity': quatity,
    };
  }

  factory DeviceModel.fromMap(Map<String, dynamic> map) {
    return DeviceModel(
      name: map['name'],
      whatts: map['whatts'],
      quatity: map['quatity'],
    );
  }
}
