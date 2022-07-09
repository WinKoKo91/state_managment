import 'package:flutter/material.dart';
import 'package:state_managment/app/modules/register_page.dart';

import '../widgets/cutsom_button_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/welcome.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/images/clouds.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      right: 20, left: 20, bottom: 20, top: 90),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Welcome to Ready to Travel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                          'Sign up with Facebook for the most fulfilling trip planning expreience with us!',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14)),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtonWidget(
                        label: 'Log in with Facebook',
                        onPressed: () {},
                      ),
                      CustomButtonWidget(
                          label: 'Log in with email address', onPressed: () {}),
                      CustomButtonWidget(
                          label: 'Create a new account',
                          bgColor: Colors.cyanAccent,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                          }),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
