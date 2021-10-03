import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_task/Components/Widgets.dart';
import 'package:youtube_task/Constants.dart';
import 'package:youtube_task/Controllers/UserManagementController.dart';
import 'package:youtube_task/Responsive_Layout.dart';
import 'package:youtube_task/Services/AuthService.dart';
import 'package:youtube_task/User_Management_Screens/Registration_Screen.dart';
import 'package:youtube_task/wrapper.dart';

class Login_Screen extends StatelessWidget {
  String email;
  String password;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final UserManagementController userManagementController =
      Get.put(UserManagementController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.green,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'Youtube Task',
              style: GoogleFonts.pacifico()
                  .copyWith(color: Colors.white, fontSize: 25),
            )),
            // SizedBox(
            //   height: ResponsiveLayout(context: context).height() * 0.2,
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: userManagementController.loading == true
                      ? Center(
                          child: Container(
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.green,
                              )),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 16),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (val) => val.isEmpty ||
                                        kValidateEmail(val.trim()) == false
                                    ? "Valid Email Required"
                                    : null,
                                decoration:
                                    kTextFieldInputDecorationWithBorders(
                                        'e.g. usman@yahoo.com',
                                        "Email",
                                        Icons.email),
                                onChanged: (val) {
                                  email = val;
                                },
                              ),
                              SizedBox(
                                height: ResponsiveLayout(context: context)
                                        .height() *
                                    0.03,
                              ),
                              TextFormField(
                                obscureText: true,
                                validator: (val) =>
                                    val.isEmpty || val.length < 6
                                        ? "6-digit Password Required"
                                        : null,
                                decoration:
                                    kTextFieldInputDecorationWithBorders(
                                        'xxxxxx', 'Password', Icons.vpn_key),
                                onChanged: (val) {
                                  password = val;
                                },
                              ),
                              SizedBox(
                                height: ResponsiveLayout(context: context)
                                        .height() *
                                    0.02,
                              ),
                              OutlineButtonCustomized(
                                  context: context,
                                  color: Colors.green,
                                  text: "LOGIN",
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      try {
                                        await userManagementController
                                            .loginUser(
                                                email: email.trim(),
                                                password: password.trim());
                                        Get.offAll(Wrapper());
                                      } catch (e) {
                                        print(e);
                                      }
                                    }
                                  }),
                              SizedBox(
                                height: ResponsiveLayout(context: context)
                                        .height() *
                                    0.02,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: 'No Account? ',
                                      children: [
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () =>
                                                  Get.to(Registration_Screen()),
                                            text: 'Create one',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                              decoration:
                                                  TextDecoration.underline,
                                            ))
                                      ],
                                      style: TextStyle(color: Colors.black87)))
                              // Text('No Account? Create one')
                            ],
                          ),
                        ),
                );
              }),
            )
          ],
        ),
      ),
    ));
  }
}
