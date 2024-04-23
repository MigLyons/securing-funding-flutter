import 'package:flutter/material.dart';

class SF_Volunteer extends StatelessWidget {
  final List<Volunteer> volunteers = [
    Volunteer("Availability1", 1001, "Name1", "Phone1", "Position1"),
    Volunteer("Availability2", 1002, "Name2", "Phone2", "Position2"),
    Volunteer("Availability3", 1003, "Name3", "Phone3", "Position3"),
    // Add more Volunteers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const<DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text('Name', style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
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
          for (var volunteer in volunteers)
            DataRow(
              cells: [
                DataCell(
                  Text(volunteer.name),
                ),
                DataCell(
                  Text(volunteer.availability),
                ),
                DataCell(
                  Text(volunteer.bidnumber.toString()),
                ),
                DataCell(
                  Text(volunteer.phone),
                ),
                DataCell(
                  Text(volunteer.position),
                ),
              ],
            )
        ],
      ),
    );
  }
}

class Volunteer {
  final String availability;
  final int bidnumber;
  final String name;
  final String phone;
  final String position;

  Volunteer(
    this.availability,
    this.bidnumber,
    this.name,
    this.phone,
    this.position,
  );
}
