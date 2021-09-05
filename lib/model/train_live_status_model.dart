class CurrentStation {
  final String serialNo;
  final String stationName;
  final String stationCode;
  final String day;
  final String scheduleArrival;
  final String actualArrival;
  final String delayInArrival;
  final String scheduleDeparture;
  final String actualDeparture;
  final String delayInDeparture;

  const CurrentStation({
    this.serialNo = '',
    this.stationName = '',
    this.stationCode = '',
    this.day = '',
    this.scheduleArrival = '',
    this.actualArrival = '',
    this.delayInArrival = '',
    this.scheduleDeparture = '',
    this.actualDeparture = '',
    this.delayInDeparture = '',
  });
}

class TrainRouteInfo {
  final String serialNo;
  final String stationName;
  final String stationCode;
  final String day;
  final String scheduleArrival;
  final String actualArrival;
  final String delayInArrival;
  final String scheduleDeparture;
  final String actualDeparture;
  final String delayInDeparture;

  const TrainRouteInfo({
    this.serialNo = '',
    this.stationName = '',
    this.stationCode = '',
    this.day = '',
    this.scheduleArrival = '',
    this.actualArrival = '',
    this.delayInArrival = '',
    this.scheduleDeparture = '',
    this.actualDeparture = '',
    this.delayInDeparture = '',
  });
}

class LiveTrainInfo {
  String responseCode;
  String startDate;
  String trainNumber;
  CurrentStation currentStation;
  List<TrainRouteInfo> trainRoute;
  String message;

  LiveTrainInfo({
    this.responseCode = '',
    this.startDate = '',
    this.trainNumber = '',
    this.currentStation = const CurrentStation(),
    this.trainRoute = const [TrainRouteInfo()],
    this.message = '',
  });
}
// class TrainLiveStatusModel{
//   String trainNo;
//   String date;

//   TrainLiveStatusModel({required this.trainNo,required this.date});
// }