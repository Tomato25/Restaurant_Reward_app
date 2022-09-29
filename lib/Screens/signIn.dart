import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reward_run/Screens/register.dart';
import 'package:reward_run/authentication.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();



class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white),

          child: ListView(
            shrinkWrap: true,
            children: <Widget>[Center(
              child: Column(
                children: <Widget>[
                  Container (
                      width: MediaQuery.of(context).size.width ,
                      height:  MediaQuery.of(context).size.height * 1.2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Colors.lightGreen[900],
                                Colors.lightGreen[400],
                              ])),

                   child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height:  MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:Column(children: <Widget>[

                         Padding(
                           padding: const EdgeInsets.fromLTRB(20.0, 150, 20, 20),
                           child: SvgPicture.asset(
                              "assets/fitnestracker.svg", width: 200.0,
                              height: 200.0),
                         ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 100, 20, 20),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(

                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(color: Colors.pinkAccent[700], width: 2)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.pinkAccent[700], width: 10),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.pinkAccent[700], fontStyle: FontStyle.italic),

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 20),
                          child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(

                                enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(color: Colors.pinkAccent[700], width: 2)
                                  ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pinkAccent[700], width: 10),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.pinkAccent[700], fontStyle: FontStyle.italic),

                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: RaisedButton(
                            color: Colors.pinkAccent[700],
                            padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                            splashColor: Colors.pinkAccent,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),

                            ),
                            onPressed: () {
                              context.read<AuthenticationService>().signIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim()
                              );
                            },
                            child: Text("SIGN IN"),
                          ),
                        ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 80, 25, 0),
                              child: RaisedButton(
                                color: Colors.pinkAccent[200],
                                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                splashColor: Colors.pinkAccent[100],
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),

                                ),
                                onPressed: ()
                                {Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Register()));
                                },
                                child: Text("Register Here"),
                              ),
                            ),
                      ])))],
              ),
            )],
          )
      ),

    );
  }
}
