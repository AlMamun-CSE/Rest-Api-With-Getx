import 'package:api_and_getx/controllers/train_live_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteList extends StatelessWidget {
  // Injecting instance in a memory
  final _liveTrainInfoController = Get.put(LiveTrainInfoController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var _liveTrainInfoControllerValue =
            _liveTrainInfoController.liveTrainInfo.value;

        return ListView.builder(
          itemCount: _liveTrainInfoControllerValue.trainRoute.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  minVerticalPadding: 10,
                  tileColor: Colors.white,
                  leading: Text(
                    "${_liveTrainInfoControllerValue.trainRoute[index].serialNo}",
                    style: TextStyle(fontSize: 18),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${_liveTrainInfoControllerValue.trainRoute[index].stationCode}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${_liveTrainInfoControllerValue.trainRoute[index].stationName}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
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
                            "A :${_liveTrainInfoControllerValue.trainRoute[index].scheduleArrival}",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "D: ${_liveTrainInfoControllerValue.trainRoute[index].scheduleDeparture}",
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
                            "A :${_liveTrainInfoControllerValue.trainRoute[index].actualArrival}",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "D: ${_liveTrainInfoControllerValue.trainRoute[index].actualDeparture}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            );
          },
        );
      },
    );
  }
}