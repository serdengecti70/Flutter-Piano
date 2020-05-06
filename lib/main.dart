import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(MaterialApp(
      title: "Small Piano",
      debugShowCheckedModeBanner: false,
      home: Piano(),
    ));

class Piano extends StatefulWidget {
  @override
  _PianoState createState() => _PianoState();
}

class _PianoState extends State<Piano> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Pbutton(
            note: "g",
            color: Colors.redAccent,
          ),
          Pbutton(
            note: "f",
            color: Colors.yellowAccent,
          ),
          Pbutton(
            note: "eb",
            color: Colors.orangeAccent,
          ),
          Pbutton(
            note: "d",
            color: Colors.tealAccent,
          ),
          Pbutton(
            note: "c",
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

void notePlayer(String note) {
  final player = AssetsAudioPlayer();
  player.open(Audio("assets/$note.wav"));
}

class Pbutton extends StatelessWidget {
  const Pbutton({this.color, this.note});
  final color;
  final note;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        //Flatbutton has default padding
          onTap: () => notePlayer(note),
          //enablefeedback for disable button sound when clicked
          enableFeedback: false,
          child: Container(
            color: color,
          )),
    );
  }
}
