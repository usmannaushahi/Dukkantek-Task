import 'package:get/state_manager.dart';
import 'package:youtube_task/Services/AuthService.dart';

class UserManagementController extends GetxController {
  var loading = false.obs;

  String? email;
  String? password;

  registerUser() async {
    loading(true);

    await AuthService().createUserwithEmailPassword(
        email: email!.trim(), password: password!.trim());

    loading(false);
  }

  loginUser() async {
    loading(true);

    await AuthService().signinUserwithEmailPassword(
        email: email!.trim(), password: password!.trim());
    loading(false);
  }
}
