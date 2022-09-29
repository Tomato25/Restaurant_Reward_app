import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:reward_run/Screens/dashboard.dart';
import 'package:reward_run/Screens/home.dart';
import 'package:reward_run/Screens/rewards.dart';
import 'package:reward_run/Screens/useraccount.dart';
import 'package:reward_run/Screens/businessPage.dart';
import 'package:provider/provider.dart';
import 'authentication.dart';
import 'dart:async';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedIndex = 0;
  final screen = [HomeScreen(), DashboardScreen(), RewardsScreen(), AccountScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green,
        backgroundColor: Colors.white70,
        buttonBackgroundColor: Colors.green,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 20, color: Colors.white,),
          Icon(Icons.directions_run, size: 20, color: Colors.white,),
          Icon(Icons.card_giftcard, size: 20, color: Colors.white,),
          Icon(Icons.account_circle_outlined, size: 20, color: Colors.white,),

        ],
        animationDuration: Duration(
            milliseconds: 200
        ),
        animationCurve: Curves.easeInOut,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        }
      ),

      body: screen[selectedIndex],
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.lightGreen,
                    Colors.lightGreenAccent,
                  ])
              ),
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10,
                      )
                    ],
                  )),
            ),
            CustomListTile(Icons.account_circle, "Profile", () =>
            {Navigator.push(context,
                MaterialPageRoute(builder: (context) => AccountScreen()))}),
            CustomListTile(Icons.lock, "Log out", () => {context.read<AuthenticationService>().signOut()
            }),
          ],
        ));
  }
}

class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white70,
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
          splashColor: Colors.lightGreenAccent,
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 60,
                child: Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text, style: TextStyle(
                          fontSize: 16.0
                      ),),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}


