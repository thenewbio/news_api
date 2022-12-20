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
      backgroundColor: lowGrey,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
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
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              CardWidget(
                  height: 70,
                  size: 15,
                  text: 'Night vision mode',
                  setState: () {},
                  state: !state,
                  color: white),
              const SizedBox(
                height: 15,
              ),
              const ScheduleNightModeWidget(),
              const SizedBox(
                height: 15,
              ),
              CardWidget(
                  height: 70,
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
                height: 70,
              ),
              SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(green),
                      ),
                      onPressed: () {},
                      child: const AppText(
                        text: 'Save',
                        size: 16,
                        color: white,
                        weight: FontWeight.bold,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
