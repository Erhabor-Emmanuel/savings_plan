import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/savings_screen.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static List<Widget> pages = <Widget>[
    Container(),
    Container(color: Colors.amber,),
    // TODO 1: Replace with grocery screen
    const SavingsScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO 9: Wrap inside a Consumer Widget
    return Consumer<TabManager>(builder: (context, tabManager, child){
      return Scaffold(
        appBar: AppBar(
          title: Text('Fooderlich', style: Theme.of(context).textTheme.headline6,),
        ),
        //  Todo: Show selected tab
        body: pages[tabManager.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          // 5
          selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
          // 10
          currentIndex: tabManager.selectedTab,
          // 11
          onTap: (index){
            tabManager.goToTab(index);
          },
          // 6
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy',
            ),
          ],
        ),
      );
    });
  }
}
