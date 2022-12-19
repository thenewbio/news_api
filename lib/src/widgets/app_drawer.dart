import 'package:flutter/material.dart';
import 'package:news_api/src/constants.dart';
import 'package:news_api/src/views/night_mode_screen.dart';
import 'package:news_api/src/widgets/app_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 50, 5, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(
                Icons.home,
                color: deepOrange,
              ),
              title: const AppText(text: 'Home', size: 20),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.sunny,
                color: deepOrange,
              ),
              title: const AppText(text: 'Night Mode', size: 20),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const NightModeScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
