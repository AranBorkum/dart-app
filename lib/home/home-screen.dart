import 'package:flutter/material.dart';
import 'package:meq/home/drawer.dart';
import 'package:meq/home/templater.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<TextEditingController> _textControllers = [];
  List<TextStyle> _textStyles = [];
  List<TextAlign> _textAlignment = [];
  List<InputDecoration> _textDecoration = [];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print("Action");
        }
      ),

      body: ListView.builder(
        itemCount: _textControllers.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red,),
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
            )
          );
        }
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.deepOrange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.title),
            label: "Title",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Subtitle"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: "Paragraph"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel),
            label: "Clear"
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;

            switch(_selectedIndex) {
              case 0:
                _textControllers.add(TextEditingController());
                _textStyles.add(TextStyle(fontSize: 32, color: Colors.blue));                
                _textAlignment.add(TextAlign.center);
                _textDecoration.add(InputDecoration(border: InputBorder.none, hintText: "(Heading)"));
                break;
              case 1:
                _textControllers.add(TextEditingController());
                _textStyles.add(TextStyle(fontSize: 24, color: Colors.blue));                
                _textAlignment.add(TextAlign.center);
                _textDecoration.add(InputDecoration(border: InputBorder.none, hintText: "(Sub-heading)"));
                break;  
              case 2:
                _textControllers.add(TextEditingController());
                _textStyles.add(TextStyle(fontSize: 16, color: Colors.black));                
                _textAlignment.add(TextAlign.left);
                _textDecoration.add(InputDecoration(border: InputBorder.none, hintText: "(Paragraph)"));
                break;  
              case 3:
                _textControllers = [];
                _textStyles = [];
                _textAlignment = [];
                _textDecoration = [];                
                break;                  
            }
          });
        },
      ),
    );
  }
}