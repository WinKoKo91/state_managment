String? validatePhone(String? value) {
  String patttern = r'^(?:[+0]9)?[0-9]{8,11}$';
  RegExp regExp = new RegExp(patttern);
  if (value!.length == 0) {
    return "Phone Number is Required";
  } else if (!regExp.hasMatch(value!)) {
    return "Phone Number is invalid";
  }
  return null;
}

String? validateEmail(String? value) {
  RegExp regex = new RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  if (value!.length == 0) {
    return "Email is required";
  } else if (!regex.hasMatch(value)) {
    return "Email is invalid";
  } else
    return null;
}

String? validateFirstName(String? value) {
  RegExp regex = new RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
  if (!regex.hasMatch(value!))
    return  "First Name is required"; //labels.validator.name;
  else
    return null;
}

String? validateLastName(String? value) {
  RegExp regex = new RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
  if (!regex.hasMatch(value!))
    return "Last Name is required"; //labels.validator.name;
  else
    return null;
}

String? validateDOB(String? value) {
  RegExp regex = new RegExp(
      r"^(?:(?:(?:0[13578]|1[02])(\/)31)\1|(?:(?:0[1,3-9]|1[0-2])(\/)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:02(\/)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:(?:0?[1-9])|(?:1[0-2]))(\/)(?:0[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$");
  if (value!.isEmpty)
    return "Date of birth is required"; //labels.validator.name;
  else if (!regex.hasMatch(value)) return "Invalid Date of birth format";
  return null;
}

String? validateNationality(String? value) {
  if (value!.length == 0) {
    return "Nationality is required";
  } else
    return null;
}



String? validateResidence(String? value) {
  if (value!.length == 0) {
    return "Residence is required";
  } else
    return null;
}