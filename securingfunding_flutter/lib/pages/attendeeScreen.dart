

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:securingfunding_flutter/components/SF_Attendee.dart';

class AttendeeScreen extends StatelessWidget {
  const AttendeeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Attendees'),
      ),
      body: Center(
        child: SFAttendee(),
        ),
      );
  }
}