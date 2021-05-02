import 'package:flutter/material.dart';
import 'package:four_pics_one_word/providers/audio_player_provider.dart';
import 'package:four_pics_one_word/providers/theme_provider.dart';
import 'package:four_pics_one_word/widgets/long_button_wdiget.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String theme =
        context.read<ThemeProvider>().themeFromStorage == 0 ? 'OFF' : 'ON';

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white70),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LongButtonWidget(
              onPressed: () {
                context.read<ThemeProvider>().changeTheme();
                Navigator.pop(context);
              },
              title: 'THEME',
              subtitle: 'Dark Theme : $theme',
            ),
            SizedBox(
              height: 30.0,
            ),
            LongButtonWidget(
              onPressed: () {
                context.read<AudioPlayerProvider>().soundSet();
              },
              title: 'SOUND',
              subtitle: context.watch<AudioPlayerProvider>().volume == 0
                  ? 'OFF'
                  : 'ON',
            ),
          ],
        ),
      ),
    );
  }
}
