import 'package:news_api/src/models/days_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api/src/views/home_screen.dart';
import 'package:news_api/src/widgets/card_widget.dart';
import 'package:news_api/src/widgets/schedule_night_mode_widget.dart';

import '../constants.dart';
import '../widgets/app_text.dart';

class NightModeScreen extends StatefulWidget {
  const NightModeScreen({Key? key}) : super(key: key);

  @override
  State<NightModeScreen> createState() => _NightModeScreenState();
}

class _NightModeScreenState extends State<NightModeScreen> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const SizedBox(
                    width: 60,
                  ),
                  const Text('Night Vision',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            CardWidget(
                height: 90,
                size: 15,
                text: 'Night vision mode',
                setState: () {},
                state: !state,
                color: white),
            const ScheduleNightModeWidget(),
            CardWidget(
                height: 90,
                size: 15,
                text: 'Automatic mode',
                setState: () {
                  setState(() {
                    state = true;
                  });
                },
                state: state,
                color: green),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(green)),
                    onPressed: () {},
                    child: const AppText(text: 'Save', size: 16)))
          ],
        ),
      ),
    );
  }
}
