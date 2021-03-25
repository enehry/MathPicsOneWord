import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_pics_one_word/providers/game_screen_provider.dart';
import 'package:four_pics_one_word/screens/game_screen.dart';
import 'package:four_pics_one_word/screens/settings_screen.dart';
import 'package:four_pics_one_word/widgets/dialog_widget.dart';
import 'package:four_pics_one_word/widgets/long_button_wdiget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int stage = context.watch<GameScreenProvider>().stage;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 100.0,
                  maxWidth: 100.0,
                ),
                child: SvgPicture.asset('assets/icons/logo.svg'),
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  LongButtonWidget(
                    onPressed: () {
                      stage > 0
                          ? showDialog(
                              context: context,
                              builder: (builder) => DialogWidget(
                                  onPressed: () {
                                    context
                                        .read<GameScreenProvider>()
                                        .clearData();
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GameScreen(),
                                      ),
                                    );
                                  },
                                  isOkCancel: true,
                                  title: 'WARNING',
                                  image: 'assets/icons/warn.svg',
                                  text:
                                      'Are you sure you want a new game ? \n This will delete your progress.'),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen(),
                              ),
                            );
                    },
                    title: 'NEW GAME',
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  stage > 0
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: LongButtonWidget(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameScreen(),
                                ),
                              );
                            },
                            title: 'CONTINUE',
                          ),
                        )
                      : Container(),
                  LongButtonWidget(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                    title: 'SETTINGS',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
