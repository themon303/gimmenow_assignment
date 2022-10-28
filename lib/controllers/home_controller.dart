import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get/get.dart';
import 'package:gimmenow_assignment/data/data.dart';
import 'package:gimmenow_assignment/models/hub.dart';
import 'package:gimmenow_assignment/utils/utilities.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final List<Hub> listhub = Utilities.jsonToList(AppData.sampleData, Hub.fromJson) ?? [];

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }
}
