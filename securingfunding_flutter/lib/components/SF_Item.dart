import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class SFItem extends StatefulWidget {
  const SFItem({super.key});
  
  @override
  State<StatefulWidget> createState() => SFItemState() ; 

  static GlobalKey<SFItemState> createKey() => GlobalKey<SFItemState>();

}

class SFItemState extends State<SFItem>{
  final ItemRetrieval stuff = ItemRetrieval();

  void reload(){
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    stuff.retrieveItems();
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: reload,
        child: DataTable(
        columns: const<DataColumn>[
        DataColumn(
          label: Expanded(
          child: Text('Name', style: TextStyle(fontStyle: FontStyle.italic),),
          ),
        ),
        DataColumn(
          label:Expanded(
            child: Text('Description', style:TextStyle(fontStyle: FontStyle.italic),),
          )
        ),
        DataColumn(
          label:Expanded(
            child: Text('Value', style:TextStyle(fontStyle: FontStyle.italic),),
          )
        ),
        DataColumn(
          label:Expanded(
            child: Text('Winning Bid', style:TextStyle(fontStyle: FontStyle.italic),),
          )
        ),
      ],
       rows: <DataRow>[
        for (var Item in stuff.items) DataRow(
            cells: [
              DataCell(
                Text(Item.name),
              ),
              DataCell(
                Text(Item.description)
              ),
              DataCell( 
                Text(Item.value.toString()),
              ),
              DataCell(
                Text(Item.winningBid.toString()),
              ),
            ],
        )
       ],
      ),
      ),
    );
  }
  
}

class Item {
    final String description;
    final String name;
    final  value;
    final  winningBid;
    Item(
       this.description,
       this.name,
       this.value,
       this.winningBid, 
    );

    factory Item.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
      final data = snapshot.data();
      return Item(
        data?['description'],
        data?['name'],
        data?['value'],
        data?['winningBid']
      );
    }
    
    Map<String, dynamic> toFirestore(){
      return{
        if (description != null) "description" : description,
        if (name != null) "name" : name,
        if (value != null) "value" : value,
        if (winningBid != null) "winningBid" : winningBid,
      };
    }
 }

class ItemRetrieval{
  final items = <Item>[Item("DeWalt cordless drill, includes 2 batteries and charger", "cordless drill", 180.00, 1003),];
  final itemsRef = FirebaseFirestore
    .instance
    .collection('Items')
    .withConverter<Item>(
      fromFirestore: (snapshot, _) => Item.fromFirestore(snapshot),
      toFirestore: (Item item, _) => item.toFirestore(),
    );


   void retrieveItems() async {
    var grabbyHands = await itemsRef.get().then((value) => value.docs);
    for (var thing in grabbyHands) {
      { 
        items.add(thing.data()); 
        }
    }
  }
}