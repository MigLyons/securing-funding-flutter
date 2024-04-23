
import 'package:flutter/material.dart';

class SF_Attendee extends StatelessWidget {
  final List<Attendee> attendees = [
    Attendee("City1", "State1", "Street1", "Zip1", "Organization1", true, 1, "Name1", false, []),
    Attendee("City2", "State2", "Street2", "Zip2", "Organization2", true, 2, "Name2", false, []),
    Attendee("City3", "State3", "Street3", "Zip3", "Organization3", false, 3, "Name3", true, []),
    // Add more Attendees as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const<DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text('City', style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text('State', style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text('Street', style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text('Zip', style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
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
        ],
        rows: <DataRow>[
          for (var attendee in attendees)
            DataRow(
              cells: [
                DataCell(
                  Text(attendee.city),
                ),
                DataCell(
                  Text(attendee.state),
                ),
                DataCell(
                  Text(attendee.street),
                ),
                DataCell(
                  Text(attendee.zip),
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
              ],
            )
        ],
      ),
    );
  }
}

class Attendee {
  final String city;
  final String state;
  final String street;
  final String zip;
  final String organization;
  final bool paid;
  final int table;
  final String name;
  final bool plusOne;
  final List<String> wins;

  Attendee(
    this.city,
    this.state,
    this.street,
    this.zip,
    this.organization,
    this.paid,
    this.table,
    this.name,
    this.plusOne,
    this.wins,
  );
}
