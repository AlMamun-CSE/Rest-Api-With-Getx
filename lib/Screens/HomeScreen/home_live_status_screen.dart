import 'package:api_and_getx/Screens/HomeScreen/Widgets/form_info.dart';
import 'package:flutter/material.dart';

import 'Widgets/train_no_of_card.dart';

class HomeLiveStatusScreen extends StatelessWidget {
  const HomeLiveStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Rail Standpoint",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.w400,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            FormInfo(),
            TrainNoCard(),
          ],
        ),
      ),
    );
  }
}
