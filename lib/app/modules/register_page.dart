import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:state_managment/app/modules/home_page.dart';
import 'package:state_managment/app/user_model.dart';
import 'package:state_managment/app/widgets/cutsom_button_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../utils/validator.dart';
import '../widgets/custom_textfield_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fNameTEController = TextEditingController();
  TextEditingController lNameTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController dobTEController = TextEditingController();
  TextEditingController nationalityTEController = TextEditingController();
  TextEditingController residenceTEController = TextEditingController();

  String? mobile;
  String selectedGender = '';
  List<String> genderList = ['Female', 'Male'];

  @override
  void initState() {
    selectedGender = genderList.first;
    super.initState();
  }

  @override
  void dispose() {
    fNameTEController.dispose();
    lNameTEController.dispose();
    emailTEController.dispose();
    dobTEController.dispose();
    nationalityTEController.dispose();
    residenceTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        color: Color(0xFFF5F5F5),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Almost there!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                'Complete the form below to create \nyour Ready To Travel account.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            ),
                            Text('*Mandaory',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade600)),
                          ],
                        ),
                      ),
                      _buildRegisterFormWidget(),
                    ],
                  ),
                  Positioned(
                      top: 76,
                      right: 20,
                      child: Image.asset(
                        'assets/images/guitar.png',
                        height: 100,
                      ))
                ],
              )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButtonWidget(
                      label: 'Create a new account',
                      bgColor: Colors.cyanAccent,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          UserModel model = UserModel(
                              fNameTEController.text,
                              lNameTEController.text,
                              emailTEController.text,
                              dobTEController.text,
                              selectedGender,
                              nationalityTEController.text,
                              residenceTEController.text,
                              mobile);

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomePage(model)),
                              (Route<dynamic> route) => false);
                        }
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterFormWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              label: 'First Name *',
              validator: validateFirstName,
              controller: fNameTEController,
            ),
            CustomTextField(
              label: 'Last Name *',
              validator: validateLastName,
              controller: lNameTEController,
            ),
            CustomTextField(
              label: 'Email Address *',
              validator: validateEmail,
              keyboardType: TextInputType.emailAddress,
              controller: emailTEController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: 'DD/MM/YYYY',
                    label: 'Date of Birth *',
                    suffixIcon: Image.asset(
                      'assets/icons/dob.png',
                      height: 32,
                    ),
                    keyboardType: TextInputType.datetime,
                    validator: validateDOB,
                    controller: dobTEController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ToggleSwitch(
                    minWidth: 70.0,
                    cornerRadius: 20.0,
                    activeBorders: [
                      Border.all(
                        color: Colors.blueAccent,
                      ),
                      Border.all(
                        color: Colors.blueAccent,
                      )
                    ],
                    activeBgColor: const [
                      Colors.white,
                      Colors.white,
                    ],
                    activeFgColor: Colors.black,
                    inactiveBgColor: Color(0xFFE2E2E2),
                    inactiveFgColor: Colors.black,
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    labels: genderList,
                    radiusStyle: true,
                    onToggle: (index) {
                      selectedGender = genderList[index!];
                    },
                  ),
                ),
              ],
            ),
            CustomTextField(
              label: 'Nationality *',
              validator: validateNationality,
              controller: nationalityTEController,
            ),
            CustomTextField(
              label: 'Country of Residence *',
              validator: validateResidence,

              controller: residenceTEController,

            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Mobile no.(Optional)',
                ),
                showCountryFlag: false,
                showDropdownIcon: false,
                disableLengthCheck: true,
                initialCountryCode: 'MM',
                validator: (phoneNumber) {
                  String? result = validatePhone(phoneNumber!.completeNumber);
                  return result;
                },
                onChanged: (phone) {
                  mobile = phone.completeNumber;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
