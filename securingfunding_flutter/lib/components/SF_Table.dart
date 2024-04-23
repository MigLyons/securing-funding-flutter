import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SFTable extends StatefulWidget {
  const SFTable({super.key});

  @override
  State<StatefulWidget> createState() => SFTableState();

  static GlobalKey<SFTableState> createKey() => GlobalKey<SFTableState>();
}

class SFTableState extends State<SFTable> {
  final TableRetrieval stuff = TableRetrieval();

  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    stuff.retrieveTables();
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: reload,
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
            for (var Table in stuff.tables)
              DataRow(
                cells: [
                  DataCell(
                    Text(Table.organization),
                  ),
                  DataCell(
                    Text(Table.seatCount.toString()),
                  ),
                  DataCell(
                    Text(Table.seats.join(", ")),
                  ),
                  DataCell(
                    Text(Table.tableid.toString()),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class Table {
  final  organization;
  final  seatCount;
  final List<dynamic> seats;
  final int tableid;
  Table(
    this.organization,
    this.seatCount,
    this.seats,
    this.tableid,
  );

  factory Table.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Table(
      data?['Organization'],
      data?['seatCount'],
      data?['seats'],
      data?['tableid'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (organization != null) "organization": organization,
      if (seatCount != null) "seatCount": seatCount,
      if (seats != null) "seats": seats,
      if (tableid != null) "tableid": tableid,
    };
  }
}

class TableRetrieval {
  final tables = <Table>[
    Table("Organization1", 6, ["Seat1", "Seat2", "Seat3", "Seat4", "Seat5", "Seat6"], 1001),
  ];
  final tablesRef = FirebaseFirestore
    .instance
    .collection('Tables')
    .withConverter<Table>(
        fromFirestore: (snapshot, _) => Table.fromFirestore(snapshot),
        toFirestore: (Table table, _) => table.toFirestore(),
      );

  void retrieveTables() async {
    var grabbyHands = await tablesRef.get().then(
      (value) =>  value.docs);
    for (var thing in grabbyHands) {
      {
        tables.add(thing.data());
      }
    }
  }


}
