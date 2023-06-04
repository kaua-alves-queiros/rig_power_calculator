class Device {
  String name;
  double whatts;
  int quatity;

  Device({
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

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      name: map['name'],
      whatts: map['whatts'],
      quatity: map['quatity'],
    );
  }
}
