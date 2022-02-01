import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_task/Components/Buttons.dart';
import 'package:youtube_task/Constants.dart';
import 'package:youtube_task/Controllers/UserManagementController.dart';
import 'package:youtube_task/Services/AuthService.dart';
import 'package:youtube_task/wrapper.dart';

class Registration_Screen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final UserManagementController userManagementController = Get.find();
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                return Card(
                  elevation: 0.3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
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
                                validator: (val) =>
                                    val!.isEmpty || val.trim().isEmail == false
                                        ? "Valid Email Required"
                                        : null,
                                decoration:
                                    kTextFieldInputDecorationWithBorders(
                                        'e.g. usman@yahoo.com',
                                        "Email",
                                        Icons.email),
                                onChanged: (val) {
                                  userManagementController.email = val;
                                },
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                obscureText: true,
                                validator: (val) =>
                                    val!.isEmpty || val.length < 6
                                        ? "6-digit Password Required"
                                        : null,
                                decoration:
                                    kTextFieldInputDecorationWithBorders(
                                        'xxxxxx', 'Password', Icons.vpn_key),
                                onChanged: (val) {
                                  userManagementController.password = val;
                                },
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              OutlineButtonCustomized(
                                  context: context,
                                  color: Colors.green,
                                  text: "REGISTER",
                                  onPressed: () async {
                                    // print(email + password!);
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        await userManagementController
                                            .registerUser();
                                        Get.offAll(()=>Wrapper());
                                      } catch (e) {
                                        print(e);
                                      }
                                    }
                                  }),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: 'Already have an account? ',
                                      children: [
                                        TextSpan(
                                            text: 'LOGIN',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () => Get.back(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                              decoration:
                                                  TextDecoration.underline,
                                            ))
                                      ],
                                      style: TextStyle(color: Colors.black87)))
                            ],
                          ),
                        ),
                );
              }),
            ),
          ],
        ),
      ),
    ));
  }
}
