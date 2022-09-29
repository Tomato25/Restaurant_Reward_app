import 'package:reward_run/authentication.dart';
import 'package:flutter/material.dart';
import 'package:reward_run/mainscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';



class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Account")),
          backgroundColor: Colors.green,
        ),

        body:_buildBody(context)
    );



  }
}

Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('UserData').snapshots(),
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

    var Userdata = record.points;
    var UserPoints = Userdata.toString();

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width:  MediaQuery.of(context).size.width ,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("First name: ", textAlign: TextAlign.left,  style: TextStyle(fontSize: 25)),
                  ),
                ),
                Container(
                  child: Text(record.name, textAlign: TextAlign.left,  style: TextStyle(fontSize: 25)),
                ),
              ],
            ),),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 5,
            color: Colors.green,
          ),
              Row(
              children: <Widget>[
              Container(
              child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Last name: ", textAlign: TextAlign.left,  style: TextStyle(fontSize: 25)),
              ),
              ),
              Container(
              child: Text(record.lastName, textAlign: TextAlign.left,  style: TextStyle(fontSize: 25)),
              ),
              ],
              ),
              Container(
              width: MediaQuery.of(context).size.width,
              height: 5,
              color: Colors.green,
              ),

          Container(
            height: MediaQuery.of(context).size.height * 0.1,

            child: Row(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Email: " ,textAlign: TextAlign.left,  style: TextStyle(fontSize: 25)),
                  ),),
                Container(
                  child: Text(record.email, textAlign: TextAlign.left,  style: TextStyle(fontSize: 25)),
                ),
              ],
            ),),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 5,
            color: Colors.green,
          ),Container(
            height: MediaQuery.of(context).size.height * 0.1,

            child: Row(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Adress: " ,textAlign: TextAlign.left,  style: TextStyle(fontSize: 25)),
                  ),),
                Container(
                  child: Text(record.adress, textAlign: TextAlign.left,  style: TextStyle(fontSize: 25)),
                ),
              ],
            ),),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 5,
            color: Colors.green,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,

            child: Row(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Points: " ,textAlign: TextAlign.left,  style: TextStyle(fontSize: 25)),
                  ),),
                Container(
                  child: Text(UserPoints, textAlign: TextAlign.left,  style: TextStyle(fontSize: 25)),
                ),
              ],
            ),),
          ButtonTheme(
              minWidth: 400,
              height: 50,

              child: RaisedButton(onPressed: () =>
              {context.read<AuthenticationService>().signOut()},
                child: const Text('Log out', style: TextStyle(fontSize: 20)),
                color: Colors.pinkAccent[700],
                padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                splashColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                elevation: 5,
              ))],
      ),
    );
}


class Record {
  final String name;
  final String adress;
  final String email;
  final String lastName;
  final int points;

  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['adress'] != null),
        assert(map['lastName'] != null),
        assert(map['points'] != null),
        assert(map['email'] != null),
        name = map['name'],
        lastName = map['lastName'],
        points = map['points'],
        email = map['email'],
        adress = map['adress'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);


  @override
  String toString() => "Record<$name:$adress:$points:$email:$lastName:>";
}