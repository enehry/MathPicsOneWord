import 'package:flutter/material.dart';
import 'package:four_pics_one_word/providers/game_screen_provider.dart';
import 'package:four_pics_one_word/widgets/dialog_widget.dart';
import 'package:four_pics_one_word/widgets/small_button_widget.dart';
import 'package:provider/provider.dart';

class HintButton extends StatelessWidget {
  const HintButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SmallButtonWidget(
            title: 'HINT',
            onPressed: () {
              print('hint');
              var provider = context.read<GameScreenProvider>();
              if (provider.coins >= 20) {
                provider.hint();
                if (provider.correct) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (builder) => DialogWidget(
                      title: 'CORRECT',
                      text: 'You Guess It Right + 20 Coins',
                      image: 'assets/icons/coin.svg',
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<GameScreenProvider>().resetCorrect();
                      },
                    ),
                  );
                }
              } else {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (builder) => DialogWidget(
                    title: 'MESSAGE',
                    text: 'You don\'t have not enough coins',
                    image: 'assets/icons/warn.svg',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              }
            },
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
