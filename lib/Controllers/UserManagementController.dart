import 'package:get/state_manager.dart';
import 'package:youtube_task/Services/AuthService.dart';

class UserManagementController extends GetxController {
  var loading = false.obs;

  registerUser({String email, String password}) async {
    loading(true);

    await AuthService().createUserwithEmailPassword(
        email: email.trim(), password: password.trim());

    loading(false);
  }

  loginUser({String email, String password}) async {
    loading(true);

    await AuthService().signinUserwithEmailPassword(
        email: email.trim(), password: password.trim());
    loading(false);
  }
}
