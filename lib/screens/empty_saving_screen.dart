import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saving/models/models.dart';

class EmptySavingScreen extends StatelessWidget {
  const EmptySavingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TODO: Add Empty IMAGE
            Flexible(child: AspectRatio(
              aspectRatio: 1/1,
              child: Image.asset('assets/empty_list.png'),
            ),),
            //TODO: Add Empty screen title
            const Text(
              'You have no saving plan',
              style: TextStyle(fontSize: 21.0),
            ),
            //TODO: Add Empty screen subtitle
            const SizedBox(height: 16.0),
            const Text(
              'want to start a saving plan?\n'
                  'Tab the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            // Todo 6: Add browse recipes button
            MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
              ),
              color: Colors.green,
              onPressed: (){
                //Todo 8: Go to Recipes Tab
                Provider.of<TabManager>(context, listen: false).gotoRecipes();
              },
              child: const Text('Browse Recipes'),
            ),
          ],
        ),
      ),
    );
  }
}
