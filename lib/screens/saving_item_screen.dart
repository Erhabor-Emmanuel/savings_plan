import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:saving/models/models.dart';

class SavingItemScreen extends StatefulWidget {
  //TODO: onCreate is a callback that lets you know when a new item is created
  final Function(SavingItem) onCreate;
  //TODO: onUpdate is a callback that returns the updated saving item
  final Function(SavingItem) onUpdate;
  //TODO: The saving item that the user created
  final SavingItem? originalItem;
  //TODO: isUpdating determines whether the user is creating or editing an item
  final bool isUpdating;

  const SavingItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
    // isUpdating is true when originalItem is not equal to null
  }) : isUpdating = (originalItem != null), super(key: key);

  @override
  State<SavingItemScreen> createState() => _SavingItemScreenState();
}

class _SavingItemScreenState extends State<SavingItemScreen> {
  //TODO: Add grocery item screen state properties
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  //TODO: Add initstate()
  @override
  void initState(){
    final originalItem = widget.originalItem;
    if(originalItem != null){
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    super.initState();
  }

  //TODO: Add dispose()
  void dispose(){
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Add SavingItemScreen Scaffold
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                //TODO: Add callback handler
              },
              icon: const Icon(Icons.check),
          )
        ],
        elevation: 0.0,
        title: Text(
          'Saving Plan',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            //TODO: Add name TextField
            //TODO: Add Importance selection
            //TODO: Add date picker
            //TODO: Add time picker
            //TODO: Add color picker
            //TODO: Add slider
            //TODO: Add Grocery Tile
          ],
        ),
      ),
    );
  }

//TODO: Add buildNameField()
  Widget buildNameField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'E.g. Apples, Banana, 1 Bag of salt',
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
          ),
        )
      ],
    );
  }
//TODO: Add buildImportanceField()
//TODO: Add buildDateField()
//TODO: Add buildTimeField()
//TODO: Add buildColorPicker()
//TODO: Add buildQuantityField()
//TODO: Add Grocery Tile
}
