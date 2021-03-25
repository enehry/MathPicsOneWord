import 'package:flutter/cupertino.dart';
import 'package:four_pics_one_word/services/storage_util.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerProvider with ChangeNotifier {
  late final AudioPlayer _player;
  late double _volume;

  AudioPlayerProvider() {
    _player = AudioPlayer();
    _volume = _getVolumeFromStorage;
  }

  void playSound(String asset) async {
    if (_volume > 0) {
      await _player.setAsset(asset);
      _player.play();
    }
  }

  double get _getVolumeFromStorage => StorageUtil.getVolume('volume');

  void soundSet() async {
    if (_getVolumeFromStorage == 0) {
      await StorageUtil.putVolume('volume', 1.0);
      _volume = _getVolumeFromStorage;
    } else {
      await StorageUtil.putVolume('volume', 0.0);
      _volume = _getVolumeFromStorage;
    }
    print(_volume);
    notifyListeners();
  }

  double get volume => _volume;
}
