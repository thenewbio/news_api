import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api/src/widgets/dropdown_widget.dart';

import '../constants.dart';
import '../models/days_model.dart';
import 'app_text.dart';

class ScheduleNightModeWidget extends StatefulWidget {
  const ScheduleNightModeWidget({Key? key}) : super(key: key);

  @override
  State<ScheduleNightModeWidget> createState() =>
      _ScheduleNightModeWidgetState();
}

class _ScheduleNightModeWidgetState extends State<ScheduleNightModeWidget> {
  String dropdownValue = "AM";
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 300,
      child: Card(
        color: lowGrey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      text: 'Schedule night mode',
                      size: 15,
                      weight: FontWeight.bold,
                    ),
                    CupertinoSwitch(
                        // thumbColor: Colors.green,
                        activeColor: green,
                        value: true,
                        onChanged: (val) {
                          setState(() {
                            state == true;
                          });
                        })
                  ],
                ),
              ),
              const AppText(
                text: 'Start Time',
                size: 15,
                color: green,
                weight: FontWeight.bold,
              ),
              DropdownWidget(dropdownValue: dropdownValue),
              const AppText(
                text: 'Stop Time',
                size: 15,
                color: green,
                weight: FontWeight.bold,
              ),
              DropdownWidget(dropdownValue: dropdownValue),
              const AppText(
                text: 'Days to repeat',
                size: 15,
                color: green,
                weight: FontWeight.bold,
              ),
              SizedBox(
                  height: 40,
                  child: ListView.builder(
                      itemCount: daysList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xffD9D9D9),
                            radius: 20,
                            child: Center(
                              child: Text(
                                daysList[index].day,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
