import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechApi {
  static SpeechToText speech = SpeechToText();

  static Future<bool> toggleRecording({
    required Function(String text) onResult,
    required ValueChanged<bool> onListening,
  }) async {
    if (speech.isListening) {
      speech.stop();
      return true;
    }

    final isAvailable = await speech.initialize(
      onStatus: (status) => onListening(speech.isListening),
      // ignore: avoid_print
      onError: (e) => print('Error: $e'),
    );

    if (isAvailable) {
      speech.listen(onResult: (value) => onResult(value.recognizedWords));
    }

    return isAvailable;
  }
}