enum Gender { male, female }
String getToString(Gender gender) {
  return gender.toString();
}

String getGender(Gender gender) {
  // ignore: unnecessary_null_comparison
  if (gender == null) return "NoType";
  return gender.toString().replaceAll("Gender.", "");
}
