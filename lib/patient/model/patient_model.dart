class Patient {
  int id;
  String name;
  String disease;
  int fees;
  String doctor;
  String address;

  Patient({
    required this.id,
    required this.name,
    required this.disease,
    required this.fees,
    required this.doctor,
    required this.address,
  });

  static Patient fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['Id'],
      name: map['Name'],
      disease: map['Disease'],
      fees: map['Fees'],
      doctor: map['Doctor'],
      address: map['Address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Name': name,
      'Disease': disease,
      'Fees': fees,
      'Doctor': doctor,
      'Address': address,
    };
  }
}
