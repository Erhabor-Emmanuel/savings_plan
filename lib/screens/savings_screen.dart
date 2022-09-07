import 'package:flutter/material.dart';
import 'package:saving/screens/saving_item_screen.dart';
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
          final manager = Provider.of<SavingManager>(context, listen: false);
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => SavingItemScreen(
                  onCreate: (item){
                    manager.addItem(item);
                    Navigator.pop(context);
                  },
                  onUpdate: (item){},
              ),
          ),
          );

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
