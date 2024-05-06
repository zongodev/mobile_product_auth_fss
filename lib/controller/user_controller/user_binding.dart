import 'package:get/get.dart';
import 'package:product_auth_fss/controller/user_controller/user_controller.dart';

class UserBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(UserController());
  }

}