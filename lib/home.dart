import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool active = false;
  AudioPlayer advancedPlayer;

  @override
  void initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {
    advancedPlayer = await AudioCache().loop("mosquito_frequency_42-kHz.mp3");
    advancedPlayer.pause();
  }

  @override
  void dispose() {
    super.dispose();
    advancedPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mosquito Repeller Frequency',
          style: TextStyle(
            color: Colors.greenAccent[200]
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            setState(() => active = !active);
              if(active) {
                advancedPlayer.resume();
              } else {
                advancedPlayer.stop();
              }
          },
          child: Text(
            !active ? 'Repel Mosquitos' : 'STOP!',
            style: TextStyle(
              color: active ? Colors.red[500] : Colors.amber[500],
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
          color: active ? Colors.black : Colors.cyan[700],
          shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)
          ),
        ),
      ),
      backgroundColor: Colors.greenAccent[200],
    );
  }
}