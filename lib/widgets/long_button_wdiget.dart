import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';

class LongButtonWidget extends StatelessWidget {
  const LongButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  final Function onPressed;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0, // soften the shadow
            spreadRadius: 4.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              10.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: AnimatedButton(
        width: 250.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
            subtitle == null
                ? Container()
                : Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
          ],
        ),
        color: Theme.of(context).buttonColor,
        onPressed: onPressed as void Function(),
      ),
    );
  }
}
