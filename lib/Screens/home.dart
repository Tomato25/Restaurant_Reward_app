import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
        backgroundColor: Colors.green,
      ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
               Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width:  MediaQuery.of(context).size.width * 0.5,
                color: Colors.white70,
                 child: Center(child: Text("Find Nottingham historical sites!",textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold))),
               ),

               Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width:  MediaQuery.of(context).size.width * 0.5,
                color: Colors.white70,
                 child: SvgPicture.asset(
                   "assets/search.svg"),
              ),
              ]),
              Container(
                width:  MediaQuery.of(context).size.width ,
                height: 30,
                color: Colors.green
              ),
              Row(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width:  MediaQuery.of(context).size.width * 0.5,
                      color: Colors.white70,
                      child: SvgPicture.asset(
                          "assets/scaning.svg"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width:  MediaQuery.of(context).size.width * 0.5,
                      color: Colors.white70,
                      child: Center(child: Text("Scan Qr Codes and get points!",textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold))),
                    ),
                  ]),
              Container(
                width:  MediaQuery.of(context).size.width ,
                height: 30,
                color: Colors.green,
              ),
              Row(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width:  MediaQuery.of(context).size.width * 0.5,
                      color: Colors.white70,
                      child: Center(child: Text("Exchange points for discounts!",textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold))),
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width:  MediaQuery.of(context).size.width * 0.5,
                      color: Colors.white70,
                      child: SvgPicture.asset(
                          "assets/reward.svg"),
                    ),
                  ]),

            ],
          ),

    ),

    );
  }

}

