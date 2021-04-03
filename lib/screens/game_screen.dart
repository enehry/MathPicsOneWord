import 'package:flutter/material.dart';
import 'package:four_pics_one_word/providers/game_screen_provider.dart';
import 'package:four_pics_one_word/widgets/answer_widget.dart';
import 'package:four_pics_one_word/widgets/hint_button.dart';
import 'package:four_pics_one_word/widgets/images_widget.dart';
import 'package:four_pics_one_word/widgets/status_header_widget.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

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
                child: h + 100 > w
                    ? Column(
                        children: [
                          StatusHeaderWidget(),
                          HintButton(),
                          Expanded(
                            flex: 6,
                            child: ImagesWidget(),
                          ),
                          Expanded(
                            flex: 4,
                            child: AnswerWidget(),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: ImagesWidget(),
                          ),
                          Expanded(
                              child: Padding(
                            padding: h < w && w >= 765
                                ? const EdgeInsets.all(30.0)
                                : const EdgeInsets.symmetric(vertical: 30.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Column(
                                    children: [
                                      StatusHeaderWidget(),
                                      HintButton(),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Center(
                                    child: AnswerWidget(),
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
              ),
            ),
    );
  }
}
