import 'package:api_and_getx/controllers/train_live_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class LiveStation extends StatelessWidget {
  // Injecting instance in a memory
  final _liveTrainInfoController = Get.put(LiveTrainInfoController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var _liveTrainInfoControllerValue =
          _liveTrainInfoController.liveTrainInfo.value;
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://images.pexels.com/photos/235994/pexels-photo-235994.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            ),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_liveTrainInfoControllerValue.currentStation.stationCode}",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${_liveTrainInfoControllerValue.currentStation.stationName}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Schedule:",
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      "A :${_liveTrainInfoControllerValue.currentStation.scheduleArrival}",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "D: ${_liveTrainInfoControllerValue.currentStation.scheduleDeparture}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Actual:",
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      "A :${_liveTrainInfoControllerValue.currentStation.actualArrival}",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "D: ${_liveTrainInfoControllerValue.currentStation.actualDeparture}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}