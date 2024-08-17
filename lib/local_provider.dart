import 'package:flutter/cupertino.dart';
import 'package:login/localStorage_service.dart';

class LocalProvider extends ChangeNotifier {

dynamic _setQuizzquestion = [];
dynamic get setQuizzquestion => _setQuizzquestion;


getquicQuestion()async{
 _setQuizzquestion = LocalStorageService().getquicQuestion();
 notifyListeners();
}

}