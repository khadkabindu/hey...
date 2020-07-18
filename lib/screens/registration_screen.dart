import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterchat/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Hero(
                    tag: 'logo',
                    child: SvgPicture.asset('images/icons8-wechat.svg',height: 200,)),

              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(

                      decoration: InputDecoration(

                        hintText: 'Email *',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onChanged: (value){
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      decoration: InputDecoration(

                          hintText: 'Password *',

                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),

                          )
                      ),
                      onChanged: (value){
                        password = value;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0,),


                    ButtonTheme(
                      minWidth: 250,
                      child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        onPressed: () async {
//                          print(email);
//                          print(password);
                        setState(() {
                          showSpinner = true;
                        });
                        try{
                          final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          if(newUser != null){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen()));
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        }catch(e){
                          print(e);

                        }


                        },
                        child: Text('Register'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}