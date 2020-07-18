import 'package:flutter/material.dart';
import 'package:flutterchat/screens/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchat/screens/registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LetsChat(),
    );
  }
}

class LetsChat extends StatefulWidget {

  @override
  _LetsChatState createState() => _LetsChatState();
}

class _LetsChatState extends State<LetsChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                        child: Container(child: SvgPicture.asset('images/icons8-wechat.svg'),)),
                    Text('hey...',style: TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.bold,fontSize: 40),),
                  ],
                ),
              ),
              ButtonTheme(
                minWidth: 250,
                child: RaisedButton(
                  color: Colors.lightBlueAccent,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text('Login'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              ButtonTheme(
                minWidth: 250,
                child: RaisedButton(
                  color: Colors.lightBlueAccent,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationScreen()),
                    );
                  },
                  child: Text('Register'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
