class UserModel {
  String firstName;
  String lastName;
  String email;
  String dob;
  String gender;
  String nationality;
  String countryOfResidence;
  String? mobile;

  UserModel(this.firstName, this.lastName, this.email, this.dob, this.gender,
      this.nationality, this.countryOfResidence, this.mobile);

  @override
  String toString() {
    return 'firstName: $firstName, \nlastName: $lastName, \nemail: $email, \ndob: $dob, \ngender: $gender, \nnationality: $nationality, \ncountryOfResidence: $countryOfResidence, \nmobile: $mobile';
  }
}
