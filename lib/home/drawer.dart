import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  bool _toggleState = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
            ),
            child: Text("MEQ App"),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Send test email'),
            // ignore: avoid_print
            onTap: () {
              print("aran is great");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.save),
            title: Text('Save email'),
            // ignore: avoid_print
            onTap: () {
              print("aran is great");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.face),
            title: Row(
              children: [
                const Text("Login with biometrics."),
                Switch(
                  value: _toggleState, 
                  onChanged: (value) => setState(() {
                    _toggleState = value;
                  })
                ),
              ],
            )
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          )
        ],
      ),
    );
  }
}
