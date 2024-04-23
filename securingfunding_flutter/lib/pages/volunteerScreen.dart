import 'package:flutter/material.dart';
import 'package:securingfunding_flutter/components/SF_Volunteer.dart';

class VolunteerScreen extends StatelessWidget {
  const VolunteerScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Volunteers'),
      ),
      body: Center(
        child: SF_Volunteer()
        ),
      );
  }
}