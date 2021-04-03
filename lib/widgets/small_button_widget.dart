import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:four_pics_one_word/providers/audio_player_provider.dart';
import 'package:provider/provider.dart';

class SmallButtonWidget extends StatelessWidget {
  const SmallButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 3.0),
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
        shape: BoxShape.rectangle,
        width: title != 'HINT' && (h + 100 < w && w <= 923) ? 35.0 : 45.0,
        height: 45.0,
        color: color,
        child: Text(title, style: Theme.of(context).textTheme.bodyText2),
        onPressed: () {
          context
              .read<AudioPlayerProvider>()
              .playSound('assets/sounds/click.wav');
          onPressed();
        },
      ),
    );
  }
}
