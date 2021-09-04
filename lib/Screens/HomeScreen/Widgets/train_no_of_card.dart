import 'package:flutter/material.dart';

class TrainNoCard extends StatelessWidget {
  //const TrainNoCard({ Key? key }) : super(key: key);

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
                "Train No: 12345",
                style: TextStyle(fontSize: 24),
              ),
              Text(
                "Date: 2020-09-07",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        )
      ),
    );
  }
}
