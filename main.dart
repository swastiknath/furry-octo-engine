import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(MediaState());

class MediaState extends StatefulWidget {
  @override
  _MediaStateState createState() => _MediaStateState();
}

class _MediaStateState extends State<MediaState> {
  @override
  final _Assets = <String>[
    "note1.wav",
    "note2.wav",
    "note3.wav",
    "note4.wav",
    "note4.wav",
    "note5.wav"
  ];

  final AssetsAudioPlayer _assetAudioPlayer = AssetsAudioPlayer();
  Widget _createHarmony(
      {String displayName, int assetNum, Color color, Color splash}) {
    return Expanded(
      child: FlatButton(
        color: color,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '$displayName',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Dancing Script',
                    color: Colors.white),
              ),
              flex: 2,
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.pause_circle_filled,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () {
                  _assetAudioPlayer.playOrPause();
                },
              ),
            )
          ],
        ),
        splashColor: splash,
        onPressed: () {
          _assetAudioPlayer.dispose();
          _assetAudioPlayer.open(
            AssetsAudio(asset: 'note$assetNum.wav', folder: "/assets"),
          );
          _assetAudioPlayer.play();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _createHarmony(
                      displayName: 'A',
                      assetNum: 1,
                      color: Colors.orange,
                      splash: Colors.white),
                  _createHarmony(
                      displayName: 'B',
                      assetNum: 2,
                      color: Colors.pink[900],
                      splash: Colors.green),
                  _createHarmony(
                      displayName: 'C',
                      assetNum: 3,
                      color: Colors.green,
                      splash: Colors.orange),
                  _createHarmony(
                      displayName: 'D',
                      assetNum: 4,
                      color: Colors.blue,
                      splash: Colors.yellow),
                  _createHarmony(
                      displayName: 'E',
                      assetNum: 5,
                      color: Colors.pink,
                      splash: Colors.green),
                  _createHarmony(
                      displayName: 'F',
                      assetNum: 6,
                      color: Colors.blueGrey[900],
                      splash: Colors.green[900]),
                  _createHarmony(
                      displayName: 'G',
                      assetNum: 7,
                      color: Colors.yellow[400],
                      splash: Colors.black),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
