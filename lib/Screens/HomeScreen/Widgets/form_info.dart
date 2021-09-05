import 'package:api_and_getx/controllers/train_live_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class FormInfo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  void onSearchPressed() async {
    if (pickedDate == null && trainNo == null) {
      Get.snackbar(
        "Error",
        "Please Provide Valid Date & Train No",
        colorText: Colors.red,
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    _formKey.currentState?.save();
    final _formatedDate = DateFormat('yyyMMDD').format(pickedDate);
    print(trainNo);
    print(pickedDate);
    print(DateFormat('yyyMMDD').format(pickedDate));
    await Get.find<LiveTrainInfoController>()
        .getLiveStatusFromAPi(trainNo, _formatedDate);
  }

  String trainNo = '';
  late DateTime  pickedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Train No',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onSaved: (val) {
                  if (val != null) {
                    trainNo = val;
                  }
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                var pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 3)),
                  lastDate: DateTime.now().add(Duration(days: 4)),
                );
                pickedDate = pickedDate;
              },
            ),
            Text('Selected Date'),
            Spacer(),
            RaisedButton.icon(
              elevation: 10,
              icon: Icon(Icons.search),
              label: Text('Search'),
              onPressed: () {
                onSearchPressed();
              },
            ),
          ],
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';

// class FormInfo extends StatelessWidget {
//   //instance variable
//   DateTime? _pickedDate;
//   String? _trainNo;
//   final _formState = GlobalKey<FormState>();

//   onSearch() {
//     _formState.currentState?.save();
//     print(_pickedDate);
//     print(_trainNo);
//   }

//   //const FormInfo({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Form(
//           key: _formState,
//           child: TextFormField(
//             onSaved: (newValue) => _trainNo = newValue,
//             decoration: InputDecoration(
//               labelText: "Train No",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//         ),
//         Row(
//           children: [
//             SizedBox(
//               height: 60,
//             ),
//             IconButton(
//               onPressed: () async {
//                 _pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime.now().add(
//                     Duration(days: 3),
//                   ),
//                 );
//               },
//               icon: Icon(Icons.calendar_today),
//               color: Colors.blue,
//             ),
//             Text(
//               "Selected Date",
//               style: TextStyle(color: Colors.blue),
//             ),
//             Spacer(),
//             ElevatedButton.icon(
//               onPressed: onSearch,
//               icon: Icon(Icons.search),
//               label: Text("Search"),
//               autofocus: false,
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
