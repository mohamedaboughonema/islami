import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioManagerProvider extends ChangeNotifier {
  String? _currentPlayingUrl;
  double _currentVolume = 1;
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;
  List<String> favouriteUrls = [];
  String? get currentPlayingUrl => _currentPlayingUrl;
  double get currentvolume => _currentVolume;
  Future<void> play(String url) async {
    if (currentPlayingUrl == url) {
      isPlaying ? await _player.pause() : await _player.resume();
      isPlaying = !isPlaying;
    } else {
      await _player.stop();
      _currentPlayingUrl = url;
      await _player.play(UrlSource(_currentPlayingUrl!),
          volume: _currentVolume);
      isPlaying = true;
      _currentPlayingUrl = url;
    }
    notifyListeners();
  }

  Future<void> setVolume(double volume) async {
    _currentVolume = volume;
    await _player.setVolume(volume);
    notifyListeners();
  }

  void toggleFavourite(String url) {
    favouriteUrls.contains(url)
        ? favouriteUrls.remove(url)
        : favouriteUrls.add(url);
    notifyListeners();
  }

  Future<void> stop() async {
    await _player.stop();
    isPlaying = false;
    _currentPlayingUrl = null;
    notifyListeners();
  }
}
