import 'package:flutter/material.dart';
import 'discountpage.dart';
import 'package:reward_run/mainscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessScreen extends StatefulWidget {
  final String name;
  final String adress;
  final String email;
  final String description;
  final String discount;
  final int pointsholder;
  BusinessScreen(String this.name,String this.adress,String this.email,String this.description,String this.discount,int this.pointsholder);


  @override
  _BusinessScreenState createState() => _BusinessScreenState();

}




class _BusinessScreenState extends State<BusinessScreen> {





  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.lightGreen[900],
                    Colors.lightGreen[400],
                  ]
              )
      ),
             child: new ListView(
                 shrinkWrap: true,
             children:<Widget> [
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: 300,


                 child: Center(
                   child: Container(
                     height: 200,
                     width: 200,
                       child: ClipRRect(
                           borderRadius: BorderRadius.circular(100.0),
                       child: Image.asset("assets/"+widget.name+".jpg",fit: BoxFit.fill)
                   )),
                 ),
                 ),
               
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Container(
                     height: MediaQuery.of(context).size.height / 2,
                   child: Column(
                     children: <Widget> [Text(widget.name, textAlign: TextAlign.left, style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold)),
                       Row( children: <Widget> [Expanded(child: Padding(
                         padding: const EdgeInsets.fromLTRB(0, 20 , 0, 30),
                         child: Text(widget.description, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, color: Colors.white)),
                       ))]),
                       ButtonTheme(
                         minWidth: 400,
                         height: 50,
                         
                         child: RaisedButton(onPressed: () =>
                         {Navigator.push(context,
                             MaterialPageRoute(builder: (context) => DiscountPage(widget.pointsholder, widget.discount))),
                            editProduct(widget.pointsholder, "Retbz1GVhWYBQIvINk7Zm5V1mHG3")

                         },
                           child:  Text('Redeem ' + widget.discount + ' Discount', style: TextStyle(fontSize: 20)),
                           color: Colors.pink,
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                           textColor: Colors.white,
                           elevation: 5,
                         ),
                       )
                     ],
                   ),

                 ),
               ),

               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                     width: MediaQuery.of(context).size.width,
                     height: 300,
                     decoration: BoxDecoration(
                     ),
                     child: Column(
                       children: <Widget>[
                         Container(
                            height:50,
                           child: Row( children: <Widget> [Expanded(child: Text("Contact", textAlign: TextAlign.left, style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold)))]),

                         ),
                         Container(
                             decoration: BoxDecoration(
                                 border: Border(bottom: BorderSide(color: Colors.pink))
                             ),
                             height:50,
                             child: Row( children: [ Text("Adress:   ", textAlign: TextAlign.left, style: TextStyle(fontSize: 14.0, color: Colors.white)),
                                Text(widget.adress, textAlign: TextAlign.left, style: TextStyle(fontSize: 14.0, color: Colors.white))
                             ])
                         ),

                         Container(
                           decoration: BoxDecoration(
                               border: Border(bottom: BorderSide(color: Colors.pink))
                           ),
                           height:50,
                             child: Row( children: [ Text("Email:   ", textAlign: TextAlign.left, style: TextStyle(fontSize: 14.0, color: Colors.white)),
                               Text(widget.email, textAlign: TextAlign.left, style: TextStyle(fontSize: 14.0, color: Colors.white))
                             ])

                         ),

                       ],
                     )
                 ),
               ),
             ],
           ),
         ),
    );
  }
}


Future<void> editProduct(int pointsholder ,String id) async {
await FirebaseFirestore.instance
    .collection("UserData")
.doc(id)
.update({"points": FieldValue.increment(-pointsholder)});
}