import 'package:flutter/material.dart';

class SF_Table extends StatelessWidget {
  final List<Table> tables = [
    Table("Organization1", 6, ["Seat1", "Seat2", "Seat3", "Seat4", "Seat5", "Seat6"], 1001),
    Table("Organization2", 8, ["Seat1", "Seat2", "Seat3", "Seat4", "Seat5", "Seat6", "Seat7", "Seat8"], 1002),
    Table("Organization3", 4, ["Seat1", "Seat2", "Seat3", "Seat4"], 1003),
    // Add more Tables as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const<DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text('Organization', style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text('Seat Count', style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text('Seats', style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text('Table ID', style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
        ],
        rows: <DataRow>[
          for (var table in tables)
            DataRow(
              cells: [
                DataCell(
                  Text(table.organization),
                ),
                DataCell(
                  Text(table.seatCount.toString()),
                ),
                DataCell(
                  Text(table.seats.join(", ")),
                ),
                DataCell(
                  Text(table.tableid.toString()),
                ),
              ],
            )
        ],
      ),
    );
  }
}

class Table {
  final String organization;
  final int seatCount;
  final List<String> seats;
  final int tableid;

  Table(
    this.organization,
    this.seatCount,
    this.seats,
    this.tableid,
  );
}
