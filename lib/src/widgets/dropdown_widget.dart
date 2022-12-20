import 'package:flutter/material.dart';

import '../constants.dart';

class DropdownWidget extends StatelessWidget {
  late String dropdownValue;
  DropdownWidget({Key? key, required this.dropdownValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(12)),
        height: 40,
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              '10: 15',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 60,
              child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none),
                  value: dropdownValue,
                  items: <String>["AM", "PM"]
                      .map<DropdownMenuItem<String>>((String value) =>
                          DropdownMenuItem(value: value, child: Text(value)))
                      .toList(),
                  onChanged: (String? value) {
                    dropdownValue = value!;
                  }),
            ),
          ],
        ));
  }
}
