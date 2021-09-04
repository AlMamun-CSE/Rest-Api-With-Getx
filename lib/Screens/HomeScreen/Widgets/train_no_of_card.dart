import 'package:api_and_getx/controllers/train_live_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainNoCard extends StatelessWidget {
  //const TrainNoCard({ Key? key }) : super(key: key);
  final trainLiveStatusController = Get.put(TrainLiveStatusController());

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Train No: ${trainLiveStatusController.trainLiveStatus.value.trainNo}",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "Date: ${trainLiveStatusController.trainLiveStatus.value.date}",
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        )
      ),
    );
  }
}
