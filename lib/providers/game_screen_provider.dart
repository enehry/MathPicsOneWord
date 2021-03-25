import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:four_pics_one_word/question.dart';
import 'package:four_pics_one_word/question_bank.dart';
import 'package:four_pics_one_word/services/storage_util.dart';

class GameScreenProvider extends ChangeNotifier {
  List<String>? _answer = [];
  List<String> userAnswer = [];
  List<String> choices = [];
  bool _correct = false;
  int _coins = 0;
  int _stage = 0;
  bool isFinish = false;
  bool isWrong = false;

  GameScreenProvider() {
    _stage = getStageFromStorage();
    _coins = getCoinsFromStorage();
    setQuestion(_stage);
  }

  int getStageFromStorage() => StorageUtil.getInt('stage');

  int getCoinsFromStorage() => StorageUtil.getInt('coins');

  int get stage => _stage;

  int get coins => _coins;

  void addAnswer(int index) {
    if (userAnswer.length < _answer!.length) {
      userAnswer.add(choices[index]);
      choices.removeAt(index);
      hintCount++;
      print(index);
      answerChecker();
      notifyListeners();
    }
  }

  void answerChecker() {
    if (_answer!.length == userAnswer.length) {
      if (_answer!.join() == userAnswer.join()) {
        _correct = true;
        print("Correct");
        userAnswer = [];
        int stage = getStageFromStorage() + 1;
        int coins = getCoinsFromStorage() + 20;
        print(StorageUtil.putInt('stage', stage));
        print(StorageUtil.putInt('coins', coins));
        _stage = getStageFromStorage();
        _coins = getCoinsFromStorage();
        setQuestion(_stage);
        print(_stage);
      } else {
        HapticFeedback.mediumImpact();
        isWrong = true;
      }
    }
  }

  void removeAnswer(int index) {
    if (userAnswer.length > index) {
      choices.add(userAnswer[index]);
      userAnswer.removeAt(index);
      hintCount--;
      print('removed');
      notifyListeners();
    }
  }

  List<String>? get answer => _answer;

  bool get correct => _correct;

  void resetCorrect() => _correct = !_correct;

  void setQuestion(int index) {
    if (index < questions.length) {
      Question question = questions[index];
      _answer = question.answer;
      generateChoices();
      userAnswer = [];
      hintCount = 0;
    } else {
      isFinish = true;
    }
    notifyListeners();
  }

  void clearData() async {
    _coins = 0;
    _stage = 0;
    isFinish = false;
    setQuestion(0);
    await StorageUtil.clrData();
    notifyListeners();
  }

  void generateChoices() {
    int generateCount = 0;
    if (answer!.length >= 8) {
      generateCount = 16 - answer!.length;
    } else {
      generateCount = 8 - answer!.length;
    }
    print(generateCount);
    choices = new List.from(generateRandomString(generateCount))
      ..addAll(answer!);
    choices.shuffle();
  }

  final _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Random _rnd = Random();

  List<String> generateRandomString(int length) => List.generate(
        length,
        (_) => String.fromCharCode(
          _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      );

  int hintCount = 0;

  void hint() {
    if (hintCount < _answer!.length) {
      String charAns = _answer![hintCount];
      userAnswer.add(charAns);
      choices.remove(charAns);
      int coins = getCoinsFromStorage() - 20;
      print(StorageUtil.putInt('coins', coins));
      _coins = coins;
      hintCount++;
      answerChecker();
      notifyListeners();
    }
  }
}
