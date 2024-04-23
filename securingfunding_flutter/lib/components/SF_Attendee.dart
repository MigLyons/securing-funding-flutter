import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SFAttendee extends StatefulWidget {
  const SFAttendee({super.key});

  @override
  State<StatefulWidget> createState() => SFAttendeeState();

  static GlobalKey<SFAttendeeState> createKey() => GlobalKey<SFAttendeeState>();
}

class SFAttendeeState extends State<SFAttendee> {
  final AttendeeRetrieval stuff = AttendeeRetrieval();

  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    stuff.retrieveAttendees();
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: reload,
        child: DataTable(
          columns: const<DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text('Address', style: TextStyle(fontStyle: FontStyle.italic)),
                ),
                ),
            // DataColumn(
            //   label: Expanded(
            //     child: Text('City', style: TextStyle(fontStyle: FontStyle.italic)),
            //   ),
            // ),
            // DataColumn(
            //   label: Expanded(
            //     child: Text('State', style: TextStyle(fontStyle: FontStyle.italic)),
            //   ),
            // ),
            // DataColumn(
            //   label: Expanded(
            //     child: Text('Street', style: TextStyle(fontStyle: FontStyle.italic)),
            //   ),
            // ),
            // DataColumn(
            //   label: Expanded(
            //     child: Text('Zip', style: TextStyle(fontStyle: FontStyle.italic)),
            //   ),
            // ),
            DataColumn(
              label: Expanded(
                child: Text('Organization', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('Paid', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('Table', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('Name', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('Plus One', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('Wins', style: TextStyle(fontStyle: FontStyle.italic)),
                ),
            ),
          ],
          rows: <DataRow>[
            for (var attendee in stuff.attendees)
              DataRow(
                cells: [
                  DataCell(
                    Text(attendee.address.toString()),
                    
                    ),
                  DataCell(
                    Text(attendee.organization),
                  ),
                  DataCell(
                    Text(attendee.paid.toString()),
                  ),
                  DataCell(
                    Text(attendee.table.toString()),
                  ),
                  DataCell(
                    Text(attendee.name),
                  ),
                  DataCell(
                    Text(attendee.plusOne.toString()),
                  ),
                  DataCell(
                    Text(attendee.wins.join(", ")),
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class Attendee {
  final address;
  final String organization;
  final bool paid;
  final int table;
  final String name;
  final bool plusOne;
  final List<dynamic> wins;

  Attendee(
    this.address,
    this.organization,
    this.paid,
    this.table,
    this.name,
    this.plusOne,
    this.wins,
  );

  factory Attendee.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Attendee(
      data?['Address'],
      data?['Organization'],
      data?['Paid'],
      data?['Table'],
      data?['name'],
      data?['plus one'],
      data?['wins'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (address != null) "address" : address,
      if (organization != null) "organization": organization,
      if (paid != null) "paid": paid,
      if (table != null) "table": table,
      if (name != null) "name": name,
      if (plusOne != null) "plusOne": plusOne,
      if(wins != null) "wins": wins,
    };
  }
}

class AttendeeRetrieval {
  final attendees = <Attendee>[
    Attendee(
      {'city1', 'state1', 'street1', 59839} 
      , "Organization1", true, 1, "Name1", false, ["chainsaw", "pony"]),
  ];
  final attendeesRef = FirebaseFirestore
  .instance
  .collection('Attendees')
  .withConverter<Attendee>(
        fromFirestore: (snapshot, _) => Attendee.fromFirestore(snapshot),
        toFirestore: (Attendee attendee, _) => attendee.toFirestore(),
      );

  void retrieveAttendees() async {
    var grabbyHands = await attendeesRef.get().then((value) => value.docs);
    for (var thing in grabbyHands) {
      {
        attendees.add(thing.data());
      }
    }
  }
}
