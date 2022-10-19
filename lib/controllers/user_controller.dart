
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {

  String get username => _username.value;

  final GetStorage _getStorage = GetStorage();

  RxString _username = "Unknown User".obs;

  void changeUsername(String value){
    _username.value = value;
    _getStorage.write("username", value);
  }

  @override
  void onInit() {
    _username.value=_getStorage.read(username) ?? "UnKnow User";
    super.onInit();
  }

}