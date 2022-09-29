import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DiscountPage extends StatefulWidget {
  final int pointsCost;
  final String discount;
  DiscountPage(int this.pointsCost, String this.discount);


  @override
  _DiscountPageState createState() => _DiscountPageState();
}



class _DiscountPageState extends State<DiscountPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.lightGreen[900],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width ,
        height:  MediaQuery.of(context).size.height ,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.lightGreen[900],
                  Colors.lightGreen[400],
                ])),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                width: 300,
                height:  300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightGreen[400]),
                color: Colors.white70
              ),
                child:  QrImage(data: widget.discount),
        ),),
              Container(
                width: 300,
                height:  100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightGreen[400]),
                    color: Colors.white70
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(widget.discount + " discount", textAlign: TextAlign.center,  style: TextStyle(fontSize: 30),),
                ),
              ),



          ],
        ),
      ),


    );
  }
}