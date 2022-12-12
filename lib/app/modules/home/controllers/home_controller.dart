import 'package:get/get.dart';
import 'package:zanpakuto_ichigo/app/data/model/user/user.model.dart';
import 'package:zanpakuto_ichigo/app/data/provider/user/user.provider.dart';

class HomeController extends GetxController {
  // for fetching list of users
  var listUsers = List<Users>.empty().obs;
  var isUsersProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  void getUsers() async {
    try {
      isUsersProcessing(true);
      UsersProvider().fetchUsers().then((resp) {
        isUsersProcessing(false);
        listUsers.clear();
        listUsers.addAll(resp);
      }, onError: (e) {
        isUsersProcessing(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isUsersProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
