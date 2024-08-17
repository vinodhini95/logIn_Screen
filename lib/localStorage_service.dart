import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {

 final localStorage = const FlutterSecureStorage();


setValue(String key,dynamic value){
   localStorage.write(key: key,value: jsonEncode(value));
} 

getItem(String key)async{
  var getValueFormlocal = await localStorage.read(key: key);
  if(getValueFormlocal != null){
     return jsonDecode(getValueFormlocal);
  }else{
    return "";
  }
}


 getquicQuestion() async {  
    try {
      rootBundle.loadString('assets/json/quice_question.json').then((quicQuestion) {
        var data = json.decode(quicQuestion);
        return data;  
      });
    } catch (e) {
      return [];
    }
  }
}