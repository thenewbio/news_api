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
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      text: 'Schedule night mode',
                      size: 15,
                      weight: FontWeight.w800,
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
              AppText(
                text: 'Start Time',
                size: 15,
                color: green,
                weight: FontWeight.bold,
              ),
              DropdownWidget(dropdownValue: dropdownValue),
              AppText(
                text: 'Stop Time',
                size: 15,
                color: green,
                weight: FontWeight.bold,
              ),
              DropdownWidget(dropdownValue: dropdownValue),
              AppText(
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
                            padding: const EdgeInsets.only(right: 3),
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: index == 2
                                          ? green
                                          : index == 4
                                              ? green
                                              : lowGrey),
                                  borderRadius: BorderRadius.circular(30),
                                  color: index == 2
                                      ? white
                                      : index == 4
                                          ? white
                                          : Colors.black45.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  daysList[index].day,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: index == 2
                                          ? green
                                          : index == 4
                                              ? green
                                              : Colors.black45),
                                ),
                              ),
                            ));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
