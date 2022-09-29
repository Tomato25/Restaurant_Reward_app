import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reward_run/Screens/businessPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reward_run/mainscreen.dart';

class RewardsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RewardsScreenState();
  }

}

class RewardsScreenState extends State<RewardsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Rewards")),
        backgroundColor: Colors.green,
      ),


      body: Container(
        color: Colors.white,
      child: _buildBody(context),
    ));
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Businesses').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    var pointsholder = record.points;
    var PointsCost = pointsholder.toString();
    var name = record.name;
    var adress = record.adress;
    var email = record.email;
    var description = record.description;
    var discount = record.discount;


    return InkWell(
      onTap: () =>
    {Navigator.push(context,
        MaterialPageRoute(builder: (context) => BusinessScreen(name, adress, email, description, discount, pointsholder),))},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30.0),
        child: Container(
          decoration: BoxDecoration(
          border: Border(
          bottom: BorderSide(width: 4, color: Colors.pink),
        )),
          width: MediaQuery.of(context).size.width * 1,


             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset("assets/"+record.name+".jpg",fit: BoxFit.fill))),
                ),
                Expanded(child:ListTile(
                  title: Center(child: Text(record.discount), ),
                  subtitle: Center(child: Text(record.name)),
                  trailing: Text(PointsCost + " points")
              ),

                ),],),
            ),
        ),
      );

  }

}

class Record {
  final String name;
  final String adress;
  final int points;
  final String discount;
  final String description;
  final String email;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['adress'] != null),
        assert(map['points'] != null),
        assert(map['discount'] != null),
        assert(map['description'] != null),
        assert(map['email'] != null),
        name = map['name'],
        discount = map['discount'],
        points = map['points'],
        description = map['description'],
        email = map['email'],
        adress = map['adress'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$adress:$points:$discount:$description:$email:>";
}
