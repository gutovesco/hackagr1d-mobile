import 'package:flutter/material.dart';
import 'package:teste_nottest/src/screens/home/home.dart';
import 'package:teste_nottest/src/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            ),
            Text('Voltar',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xffFFFFFF))),
          ],
        ),
      ),
    );
  }
  

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                    SizedBox(
            height: 10,
          ),
          Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xffFFFFFF)),
          ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            textAlign: TextAlign.center,
              obscureText: isPassword,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
                focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
                hintText: title,
                  fillColor: Color(0xffffffff),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
              
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffFFFFFF), Color(0xffFFFFFF)])),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Não tem uma conta ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xffFFFFFF)),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Text(
              'Registrar',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'T',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Color(0xffFFFFFF),
          ),
          children: [
            TextSpan(
              text: 'es',
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
            TextSpan(
              text: 'te',
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 40),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Center(
      child: Column(
      children: <Widget>[
        _entryField("Email"),
        _entryField("Senha", isPassword: true),
      ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff7FA4F7), Color(0xff4286F4)])),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      _title(),
                      SizedBox(
                        height: 60,
                      ),
                      _emailPasswordWidget(),
                      SizedBox(
                        height: 40,
                      ),
                      _submitButton(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: Text('Esqueceu sua senha ?',
                            style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffFFFFFF))),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _createAccountLabel(),
                ),
                Positioned(top: 40, left: 0, child: _backButton()),
              ],
            ),
          )
        )
      );
  }
}
