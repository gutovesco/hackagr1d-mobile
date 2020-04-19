
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color palleteLightBlue = Color(0xff4286F4);

class InformationPage extends StatefulWidget {
  InformationPage({Key key}) : super(key: key);

  @override
  _InformationPageState createState() => new _InformationPageState();
}

class _InformationPageState extends State<InformationPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupCnpjController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: SafeArea(
                  child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height >= 745.0
                  ? MediaQuery.of(context).size.height
                  : 775.0,
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Color(0xff7FA4F7), Color(0xff4286F4)
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 35.0),
                  ),
                  Center(
                    child: Text('Benefícios do \n seguro residencial',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 24,
                      color: Colors.white
                    ),
                    ),
                    ),
                     SizedBox(height: 30),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (i) {
                        if (i == 0) {
                          setState(() {
                            right = Colors.white;
                            left = Colors.black;
                          });
                        } else if (i == 1) {
                          setState(() {
                            right = Colors.black;
                            left = Colors.white;
                          });
                        }
                      },
                      children: <Widget>[
                       
                        new Container(
                          child: _buildSignUp(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 16.0, fontFamily: "Rubik"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }


  Widget _buildSignUp(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 340.0,
                  height: 245.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          readOnly: true,
                          style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            hintText: "Descontos especiais",
                            hintStyle: TextStyle(
                                fontFamily: "Rubik", fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          readOnly: true,
                          style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            hintText: "Cobertura contra roubo e furto",
                            hintStyle: TextStyle(
                                fontFamily: "Rubik", fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          readOnly: true,
                          style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            hintText: "Danos cobridos pelo seguro",
                            hintStyle: TextStyle(
                                fontFamily: "Rubik", fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
                  SizedBox(height: 30),
                  Center(
                  child: Text('Quem NÃO possui \n seguro residencial',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 24,
                    color: Colors.white
                  ),
                  ),
                  ),
                   SizedBox(height: 30),

                  Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 340.0,
                  height: 245.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          readOnly: true,
                          style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                            hintText: "Preço unico",
                            hintStyle: TextStyle(
                                fontFamily: "Rubik", fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          readOnly: true,
                          style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                            hintText: "Casa vulnerável a roubo e furto",
                            hintStyle: TextStyle(
                                fontFamily: "Rubik", fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          readOnly: true,
                          style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                            hintText: "Não recebe apoio",
                            hintStyle: TextStyle(
                                fontFamily: "Rubik", fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            height: 50,
            width: 300,
                            child: Center(
                          child: Padding(
                           padding: EdgeInsets.fromLTRB(0, 0, 10, 0 ),
                          child:
                          FlatButton(
                          color: Colors.green,
                          onPressed: () {}, 
                          child: Text(
                            'Contratar',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontFamily: 'Rubik', fontSize: 18),
                            )
                          )
                          )
                              
                            )
                          ),
                          SizedBox(height: 40),
        ]
      ),
      ),
    );
  }
    }