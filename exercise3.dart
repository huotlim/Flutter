void main() {
  List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];
  List<int> passStudents = scores.where((score) => score >= 50).toList();
  print(passStudents);
  print('${passStudents.length} students passed');
}
