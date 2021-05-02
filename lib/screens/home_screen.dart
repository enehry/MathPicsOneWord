import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_pics_one_word/providers/game_screen_provider.dart';
import 'package:four_pics_one_word/screens/about_screen.dart';
import 'package:four_pics_one_word/screens/game_screen.dart';
import 'package:four_pics_one_word/screens/settings_screen.dart';
import 'package:four_pics_one_word/widgets/dialog_widget.dart';
import 'package:four_pics_one_word/widgets/long_button_wdiget.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
            Flexible(
              flex: 4,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 100.0,
                  maxWidth: 100.0,
                ),
                child: Hero(
                    tag: 'logo',
                    child: SvgPicture.asset('assets/icons/logo.svg')),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      height: 20.0,
                    ),
                    stage > 0
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
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
                    SizedBox(
                      height: 20.0,
                    ),
                    LongButtonWidget(
                      onPressed: () async {
                        PackageInfo packageInfo =
                            await PackageInfo.fromPlatform();

                        String version = packageInfo.version;
                        String buildNumber = packageInfo.buildNumber;

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AboutScreen(
                                buildNumber: buildNumber, version: version),
                          ),
                        );
                      },
                      title: 'ABOUT',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
