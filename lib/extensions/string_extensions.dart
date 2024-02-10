extension StringExtension on String {
  bool isValidAlphanumeric() {
    return RegExp(r"^[a-zA-Z0-9 ]+$").hasMatch(this);
  }

  bool isValidNumeric() {
    return RegExp(r"^[0-9]+$").hasMatch(this);
  }
}
