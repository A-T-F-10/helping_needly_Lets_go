import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/models/info/images_list.dart';
import 'package:helpings_needlys/models/info/info.dart';
import 'package:helpings_needlys/pages/pleases/info_please.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Search extends SearchDelegate {
  var speech = SpeechToText();

  bool speechRecognitionAvailable = false;
  bool isListening = false;

  String transcription = '';
  Language selectedLang = const Language('Arabic', 'ar_SA');
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: speech.isListening
            ? const Icon(Icons.mic)
            : const Icon(Icons.mic_off),
        onPressed: () => start(),
      ),
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          transcription = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
          transcription = '';
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var i in search[0]) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, itme) {
        return Card(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! / 25,
              vertical: SizeConfig.screenHeight! / 100),
          elevation: 10,
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (__) => InofPlease(
                        search,
                        itme,
                        imageListb: images,
                      )));
            },
            title: Text(matchQuery[itme]),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];
    for (var i in search[0]) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, itme) {
        return Card(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! / 25,
              vertical: SizeConfig.screenHeight! / 100),
          elevation: 10,
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (__) => InofPlease(
                        search,
                        itme,
                        imageListb: images,
                      )));
            },
            title: Text(matchQuery[itme]),
          ),
        );
      },
    );
  }

  Future<void> activateSpeechRecognizer() async {
    speech = SpeechToText();
    speechRecognitionAvailable = await speech.initialize(
        onError: errorHandler, onStatus: onSpeechAvailability);
  }

  void start() =>
      speech.listen(onResult: onRecognitionResult, localeId: selectedLang.code);

  void onSpeechAvailability(String status) {
    speechRecognitionAvailable = speech.isAvailable;
    isListening = speech.isListening;
  }

  void onRecognitionResult(SpeechRecognitionResult result) {
    query = result.recognizedWords;
  }

  void errorHandler(SpeechRecognitionError error) => print(error);
}

class Language {
  final String name;
  final String code;
  const Language(this.name, this.code);
}
