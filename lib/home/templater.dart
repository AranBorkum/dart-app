import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Templater extends StatefulWidget {
  const Templater({super.key});

  @override
  State<Templater> createState() => _TemplaterState();
}

class _TemplaterState extends State<Templater> {
  List<TextEditingController> _textControllers = [];
  List<TextStyle> _textStyles = [];
  List<TextAlign> _textAlignment = [];
  List<InputDecoration> _textDecoration = [];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _textControllers.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                _textControllers.removeAt(index);
                _textStyles.removeAt(index);
                _textAlignment.removeAt(index);
                _textDecoration.removeAt(index);
              },
              child: Container(
                child: TextField(
                  maxLines: null,
                  controller: _textControllers[index],
                  style: _textStyles[index],
                  textAlign: _textAlignment[index],
                  decoration: _textDecoration[index],
                ),
              ));
        },
      ),
      
    );
  }
}
