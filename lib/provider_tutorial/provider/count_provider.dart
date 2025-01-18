import 'package:flutter/foundation.dart';
class CountProvider with ChangeNotifier{
  int _count = 80;
  int get count=>_count;
  void setcount(){
    _count++;
    notifyListeners();
  }

}