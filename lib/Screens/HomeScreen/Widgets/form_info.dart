import 'package:flutter/material.dart';

class FormInfo extends StatelessWidget {
  //instance variable
  DateTime? _pickedDate;
  String? _trainNo;
  final _formState = GlobalKey<FormState>();

  onSearch() {
    _formState.currentState?.save();
    print(_pickedDate);
    print(_trainNo);
  }

  //const FormInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formState,
          child: TextFormField(
            onSaved: (newValue) => _trainNo = newValue,
            decoration: InputDecoration(
              labelText: "Train No",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              height: 60,
            ),
            IconButton(
              onPressed: () async {
                _pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    Duration(days: 3),
                  ),
                );
              },
              icon: Icon(Icons.calendar_today),
              color: Colors.blue,
            ),
            Text(
              "Selected Date",
              style: TextStyle(color: Colors.blue),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: onSearch,
              icon: Icon(Icons.search),
              label: Text("Search"),
              autofocus: false,
            ),
          ],
        )
      ],
    );
  }
}
