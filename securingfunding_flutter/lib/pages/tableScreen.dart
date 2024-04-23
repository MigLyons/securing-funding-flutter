import 'package:flutter/material.dart';
import 'package:securingfunding_flutter/components/SF_Table.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Tables'),
      ),
      body: Center(
        child: SF_Table()
        ),
      );
  }
}