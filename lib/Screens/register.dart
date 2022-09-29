
import 'package:flutter/material.dart';
import 'package:reward_run/authentication.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'signIn.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      height:  MediaQuery.of(context).size.height ,
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
                              child: TextFormField(
                                key: ValueKey('email'),
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                enableSuggestions: false,
                                validator: (value) {
                                  if (value.isEmpty || !value.contains('@')) {
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                  },
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

                                  )),                            ),
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
                                  context.read<AuthenticationService>().signUp(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim()
                                  );
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                                },
                                child: Text("SIGN UP"),
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
