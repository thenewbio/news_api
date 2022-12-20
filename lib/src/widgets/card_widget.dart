import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api/src/constants.dart';

import 'app_text.dart';

class CardWidget extends StatelessWidget {
  final double height;
  final double size;
  final String text;
  final Function()? setState;
  final bool state;
  final Color color;
  const CardWidget(
      {Key? key,
      required this.height,
      required this.size,
      required this.text,
      this.setState,
      required this.state,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.maxFinite,
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: text,
                size: size,
                weight: FontWeight.w800,
              ),
              CupertinoSwitch(
                  activeColor: color,
                  value: state,
                  onChanged: (val) {
                    setState!();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
