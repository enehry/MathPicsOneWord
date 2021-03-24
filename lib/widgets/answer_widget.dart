import 'package:flutter/material.dart';
import 'package:four_pics_one_word/providers/game_screen_provider.dart';
import 'package:four_pics_one_word/question_bank.dart';
import 'package:four_pics_one_word/widgets/dialog_widget.dart';
import 'package:four_pics_one_word/widgets/small_button_widget.dart';
import 'package:provider/provider.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Consumer<GameScreenProvider>(builder: (context, provider, widget) {
        List<String> choice = provider.choices;
        List<String> userAnswer = provider.userAnswer;
        List<String> answer = provider.answer!;

        int ansLength = (answer.length <= 8) ? answer.length : 8;

        int choiceLength = (choice.length <= 8) ? choice.length : 8;

        return Column(
          children: [
            for (int i = 0; i < (answer.length / 8).ceil(); i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int j = i == 0 ? 0 : 8;
                      j < ((i == 0) ? ansLength : answer.length);
                      j++)
                    SmallButtonWidget(
                      title: userAnswer.length > j ? userAnswer[j] : " ",
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        provider.removeAnswer(j);
                      },
                    ),
                ],
              ),
            SizedBox(
              height: 20.0,
            ),
            for (int i = 0; i < (choice.length / 8).ceil(); i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int j = (i == 0) ? 0 : 8;
                      j < ((i == 0) ? choiceLength : choice.length);
                      j++)
                    SmallButtonWidget(
                      title: choice[j],
                      color: Theme.of(context).buttonColor,
                      onPressed: () {
                        provider.addAnswer(j);
                        if (provider.stage < questions.length) {
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
                                  provider.resetCorrect();
                                },
                              ),
                            );
                          }
                        }
                      },
                    ),
                ],
              ),
          ],
        );
      }),
    );
  }
}
