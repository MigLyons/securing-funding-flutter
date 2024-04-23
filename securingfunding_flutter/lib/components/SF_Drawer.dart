import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class SFDrawer extends StatelessWidget {
  const SFDrawer ({super.key});
  
@override
Widget build(BuildContext context) {
  final theme = Theme.of(context);
  return Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        child: Column(
        children: <Widget>[
          Expanded(
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
            child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Attendees'),
              onTap: () {
                Navigator.pushNamed(context, '/attendees');
              },
            ),
            ListTile(
              title: const Text('Items'),
              onTap: () {
                Navigator.pushNamed(context, '/items');
              },
            ),
            ListTile(
              title: const Text('Volunteers'),
              onTap: () {
                Navigator.pushNamed(context, '/volunteers');
              },
            ),
            ListTile(
              title: const Text('Tables'),
              onTap: () {
                Navigator.pushNamed(context, '/tables');
              },
            ),
            const SignOutButton(),        
          ],
        ),
          ),
        ],
        ),
      );
}
}