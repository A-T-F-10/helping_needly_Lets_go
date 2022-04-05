import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:helpings_needlys/api/speech_api.dart';
import 'package:helpings_needlys/core/substring_highlighted.dart';

class SpeechMace extends StatefulWidget {
  @override
  _SpeechMaceState createState() => _SpeechMaceState();
}

class _SpeechMaceState extends State<SpeechMace> {
  String text = 'Press the button and start speaking';
  bool isListening = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Speech to text"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(30).copyWith(bottom: 150),
          child: SubstringHighlight(
            text: text,
            terms: [],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: isListening,
          endRadius: 75,
          glowColor: Theme.of(context).primaryColor,
          child: FloatingActionButton(
            child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
            onPressed: toggleRecording,
          ),
        ),
      );

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() => this.isListening = isListening);
        },
      );
}
