import 'dart:convert';
import 'package:api_and_getx/model/train_live_status_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as httpUsing;

class LiveTrainInfoController extends GetxController {
  var liveTrainInfo = LiveTrainInfo(
    responseCode: '200',
    startDate: "09-01-2021",
    trainNumber: "02903",
    message: "SUCCESS",
    currentStation: CurrentStation(
      serialNo: "1",
      stationName: "Mumbai Central",
      stationCode: "MMCT",
      day: "0",
      scheduleArrival: "Source",
      actualArrival: "Source",
      delayInArrival: "-",
      scheduleDeparture: "09:25PM",
      actualDeparture: "09:25PM",
      delayInDeparture: "00 M",
    ),
    trainRoute: [
      TrainRouteInfo(
        serialNo: "1",
        stationName: "Mumbai Central",
        stationCode: "MMCT",
        day: "0",
        scheduleArrival: "Source",
        actualArrival: "Source",
        delayInArrival: "-",
        scheduleDeparture: "09:25PM",
        actualDeparture: "09:25PM",
        delayInDeparture: "00 M",
      ),
      TrainRouteInfo(
        serialNo: "2",
        stationName: "Borivali",
        stationCode: "BVI",
        day: "0",
        scheduleArrival: "09:58PM",
        actualArrival: "09:58PM",
        delayInArrival: "00 M",
        scheduleDeparture: "10:01PM",
        actualDeparture: "10:01PM",
        delayInDeparture: "00 M",
      ),
    ],
  ).obs;

  Future<void> getLiveStatusFromAPi(String trainNo, String date) async {
    try {
      final url =
          'https://indianrailapi.com/api/v2/livetrainstatus/apikey/4c31705dc6543a615f0c87d516d43530/trainnumber/$trainNo/date/$date/';
      //is orders there is subfolder of user id for a specific user

      final response = await httpUsing.get(Uri.parse(url));

      if (response == null) {
        //if we dont have any orders then simply return
        //no code execution further
        return;
      }
      print(response.body);

      final List<TrainRouteInfo> _trainRoute = [];

      Map<String, dynamic> extractedData =
          json.decode(response.body) as Map<String, dynamic>;

      extractedData['TrainRoute'].forEach((eachTrainInfo) {
        _trainRoute.add(
          TrainRouteInfo(
            serialNo: eachTrainInfo['SerialNo'] ?? '',
            stationName: eachTrainInfo['StationName'] ?? '',
            stationCode: eachTrainInfo['StationCode'] ?? '',
            day: eachTrainInfo['Day'] ?? '',
            actualArrival: eachTrainInfo['ActualArrival'] ?? '',
            actualDeparture: eachTrainInfo['ActualDeparture'] ?? '',
            scheduleArrival: eachTrainInfo['ScheduleArrival'] ?? '',
            scheduleDeparture: eachTrainInfo['ScheduleDeparture'] ?? '',
          ),
        );
      });

      final liveTrainInfo = LiveTrainInfo(
        message: extractedData['Message'] ?? '',
        trainNumber: extractedData['TrainNumber'] ?? '',
        startDate: extractedData['StartDate'] ?? '',
        currentStation: extractedData['CurrentStation'] != null
            ? CurrentStation(
                serialNo: extractedData['CurrentStation']['SerialNo'] ?? '',
                stationName:
                    extractedData['CurrentStation']['StationName'] ?? '',
                stationCode:
                    extractedData['CurrentStation']['StationCode'] ?? '',
                day: extractedData['CurrentStation']['Day'] ?? '',
                actualArrival:
                    extractedData['CurrentStation']['ActualArrival'] ?? '',
                actualDeparture:
                    extractedData['CurrentStation']['ActualDeparture'] ?? '',
                scheduleArrival:
                    extractedData['CurrentStation']['ScheduleArrival'] ?? '',
                scheduleDeparture:
                    extractedData['CurrentStation']['ScheduleDeparture'] ?? '',
              )
            : CurrentStation(),
        trainRoute: _trainRoute,
      );

      print(liveTrainInfo.message);
      print(liveTrainInfo.trainNumber);
      print(liveTrainInfo.currentStation.serialNo);

      // Updating Obs value of getx
      this.liveTrainInfo.update((val) {
        val!.trainNumber = liveTrainInfo.trainNumber;
        val.currentStation = liveTrainInfo.currentStation;
        val.startDate = liveTrainInfo.startDate;
        val.trainRoute = liveTrainInfo.trainRoute;
        val.trainRoute = liveTrainInfo.trainRoute;
      });
    } catch (err) {
      Get.snackbar(
        "Error",
        "Problem in fetching from the server",
        colorText: Colors.red,
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

// import 'package:api_and_getx/model/train_live_status_model.dart';
// import 'package:get/get.dart';

// class TrainLiveStatusController extends GetxController {
//   final trainLiveStatus =
//       TrainLiveStatusModel(
//         trainNo: "4561", date: "2021-09-01"
//         ).obs;
// }
