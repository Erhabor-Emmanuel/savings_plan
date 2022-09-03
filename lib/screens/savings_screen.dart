import 'package:flutter/material.dart';
import 'empty_saving_screen.dart';
import 'package:provider/provider.dart';
import 'package:saving/models/models.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: replace with EmptySavingScreen
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          //TODO 11: Present SavingItemScreen

        },
      ),
      body: buildSavingScreen(),
    );
  }
  //TODO: Add buildSavingScreen
  Widget buildSavingScreen(){
    return Consumer<SavingManager>(
      builder: (context, manager, child){
      if(manager.savingItems.isNotEmpty){
        //TODO: Add SavingListScreen
        return Container();
      }else{
        return const EmptySavingScreen();
      }
      },
    );
  }
}
