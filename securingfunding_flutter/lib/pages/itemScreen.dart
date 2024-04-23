import 'package:flutter/material.dart';
import 'package:securingfunding_flutter/components/SF_Item.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Items'),
      ),
      body: Center(
        child: SFItem(),
        ),
      );
  }
}