import 'package:just_audio/just_audio.dart';

class AudioPlayerProvider {
  static playLoad() async {
    final player = AudioPlayer();
    await player.setAsset('assets/sounds/load.wav');
    player.play();
    Future.delayed(Duration(seconds: 3)).whenComplete(() => player.dispose());
  }

  static playCoins() async {
    final player = AudioPlayer();
    await player.setAsset('assets/sounds/coin.wav');
    player.play();
    Future.delayed(Duration(seconds: 3)).whenComplete(() => player.dispose());
  }
}
