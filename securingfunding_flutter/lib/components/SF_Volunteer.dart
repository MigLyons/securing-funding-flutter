import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SFVolunteer extends StatefulWidget {
  const SFVolunteer({super.key});

  @override
  State<StatefulWidget> createState() => SFVolunteerState();

  static GlobalKey<SFVolunteerState> createKey() => GlobalKey<SFVolunteerState>();
}

class SFVolunteerState extends State<SFVolunteer> {
  final VolunteerRetrieval stuff = VolunteerRetrieval();

  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    stuff.retrieveVolunteers();
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: reload,
        child: DataTable(
          columns: const<DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text('Availability', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('Bid Number', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('Name', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('Phone', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('Position', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
          ],
          rows: <DataRow>[
            for (var volunteer in stuff.volunteers)
              DataRow(
                cells: [
                  DataCell(
                    Text(volunteer.availability),
                  ),
                  DataCell(
                    Text(volunteer.bidnumber.toString()),
                  ),
                  DataCell(
                    Text(volunteer.name),
                  ),
                  DataCell(
                    Text(volunteer.phone.toString()),
                  ),
                  DataCell(
                    Text(volunteer.position),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class Volunteer {
  final String availability;
  final int bidnumber;
  final String name;
  final int phone;
  final String position;

  Volunteer(
    this.availability,
    this.bidnumber,
    this.name,
    this.phone,
    this.position,
  );

  factory Volunteer.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Volunteer(
      data?['availability'],
      data?['bidnumber'],
      data?['name'],
      data?['phone'],
      data?['position'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (availability != null) "availability": availability,
      if (bidnumber != null) "bidnumber": bidnumber,
      if (name != null) "name": name,
      if (phone != null) "phone": phone,
      if (position != null) "position": position,
    };
  }
}

class VolunteerRetrieval {
  final volunteers = <Volunteer>[
    Volunteer("Availability1", 1001, "Name1", 4068456523, "Position1"),
  ];
  final volunteersRef = FirebaseFirestore
    .instance
    .collection('Volunteers')
    .withConverter<Volunteer>(
        fromFirestore: (snapshot, _) => Volunteer.fromFirestore(snapshot),
        toFirestore: (Volunteer volunteer, _) => volunteer.toFirestore(),
      );

  void retrieveVolunteers() async {
    var grabbyHands = await volunteersRef.get().then((value) => value.docs);
    for (var thing in grabbyHands) {
      {
        volunteers.add(thing.data());
      }
    }
  }
}
