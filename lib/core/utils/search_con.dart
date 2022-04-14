import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SearchController extends GetxController {
  var speech = SpeechToText();

  bool speechRecognitionAvailable = false;
  bool isListening = false;

  String transcription = '';
  Language selectedLang = const Language('Arabic', 'ar_SA');

  Future<void> activateSpeechRecognizer() async {
    speech = SpeechToText();
    speechRecognitionAvailable = await speech.initialize(
        onError: errorHandler, onStatus: onSpeechAvailability);
    update();
  }

  void start() =>
      speech.listen(onResult: onRecognitionResult, localeId: selectedLang.code);

  void onSpeechAvailability(String status) {
    speechRecognitionAvailable = speech.isAvailable;
    isListening = speech.isListening;
    update();
  }

  void onRecognitionResult(SpeechRecognitionResult result) {
    transcription = result.recognizedWords;
    update();
  }

  void errorHandler(SpeechRecognitionError error) => print(error);
}

class Language {
  final String name;
  final String code;
  const Language(this.name, this.code);
}
