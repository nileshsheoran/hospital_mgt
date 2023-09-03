class Doctor {
  int id;
String name;
String specialist;
int fees;
int timing;
String path;

Doctor({
 required this.id,
  required this.name,
  required this.specialist,
  required this.fees,
  required this.timing,
  this.path='',
}
);

Map<String, dynamic> toMap() {
  return {
    'Id': id,
    'Name': name,
    'Specialist': specialist,
    'Fees': fees,
    'Timing': timing,
    'Path': path,
  };
}

static Doctor fromMap(Map<String, dynamic> map) {
  return Doctor(
    id: map['Id'],
    name: map['Name'],
    specialist: map['Specialist'],
    fees: map['Fees'],
    timing: map['Timing'],
    path: map['Path'],
  );
}
}
