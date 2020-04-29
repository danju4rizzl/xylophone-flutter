import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // Get the sound of each note asset
  getSound(soundNote) {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/note$soundNote.wav"),
    );
  }

// Renders (returns) the keys in an expanded widget
  renderKey({Color keyColor, int sound}) {
    return Expanded(
      child: FlatButton(
        color: keyColor,
        onPressed: () => getSound(sound), // child: Text('$note'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            renderKey(keyColor: Colors.red, sound: 1),
            renderKey(keyColor: Colors.orange, sound: 2),
            renderKey(keyColor: Colors.yellow, sound: 3),
            renderKey(keyColor: Colors.green, sound: 4),
            renderKey(keyColor: Colors.teal, sound: 5),
            renderKey(keyColor: Colors.blue, sound: 6),
            renderKey(keyColor: Colors.purple, sound: 7),
          ],
        )),
      ),
    );
  }
}
