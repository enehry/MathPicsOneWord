import 'package:flutter/material.dart';
import 'package:four_pics_one_word/providers/game_screen_provider.dart';
import 'package:four_pics_one_word/widgets/answer_widget.dart';
import 'package:four_pics_one_word/widgets/dialog_widget.dart';
import 'package:four_pics_one_word/widgets/images_widget.dart';
import 'package:four_pics_one_word/widgets/small_button_widget.dart';
import 'package:four_pics_one_word/widgets/status_header_widget.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<GameScreenProvider>().isFinish
          ? Center(
              child: Text(
                'TAPOS NA NABITIN KA BA ?',
                style: Theme.of(context).textTheme.headline2,
              ),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    StatusHeaderWidget(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SmallButtonWidget(
                              title: 'HINT',
                              onPressed: () {
                                print('hint');
                                var provider =
                                    context.read<GameScreenProvider>();
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
                                          context
                                              .read<GameScreenProvider>()
                                              .resetCorrect();
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
                                      text: 'MAY BAYAD ANG HINT NA 20 COINS',
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
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: ImagesWidget(),
                    ),
                    Expanded(
                      flex: 4,
                      child: AnswerWidget(),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
