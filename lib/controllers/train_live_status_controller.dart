import 'package:api_and_getx/model/train_live_status_model.dart';
import 'package:get/get.dart';

class TrainLiveStatusController extends GetxController {
  final trainLiveStatus =
      TrainLiveStatusModel(
        trainNo: "4561", date: "2021-09-01"
        ).obs;
}
