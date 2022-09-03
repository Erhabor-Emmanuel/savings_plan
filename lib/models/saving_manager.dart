import 'package:flutter/material.dart';
import 'package:saving/models/saving_items.dart';

class SavingManager extends ChangeNotifier{
  //1
  final _savingItems = <SavingItem>[];
  //2
  List<SavingItem> get savingItems => List.unmodifiable(_savingItems);

  void deleteItem(int index){
    _savingItems.removeAt(index);
    notifyListeners();
  }

  void addItem(SavingItem item){
    _savingItems.add(item);
    notifyListeners();
  }

  void updateItem(SavingItem item, int index){
    _savingItems[index] = item;
    notifyListeners();
  }

  void completeItem(int index, bool change){
    final item = _savingItems[index];
    _savingItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }

}