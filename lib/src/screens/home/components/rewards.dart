import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color palleteLightGrey = Color(0xffc4d1fa);
Color palleteLightBlue = Color(0xff4286F4);
Color palleteMediumBlue = Color(0xff4286F4);
Color palleteBlue = Color(0xff1144e8);

class BenefitsPage extends StatefulWidget {
  BenefitsPage({Key key}) : super(key: key);

  @override
  _BenefitsPage createState() => _BenefitsPage();
}

class _BenefitsPage extends State<BenefitsPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1080, height: 1860, allowFontScaling: false);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(120)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                    ),
                    Container(
        height: 150,
        width: 300,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: palleteLightBlue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: Color(0x12000000))
            ]),
            child: Center(
              child: 
              Text(
                'Seus pontos: \n 330',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Rubik',
                ),
              ),)
        ),
                  
                    SizedBox(height: 40,),
                      Row(
                        children: <Widget>[
                          Text(
                            "Benefícios disponíveis",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: palleteMediumBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow( // bottomLeft
                                  offset: Offset(-2.5, -2.5),
                                  color: Colors.white,
                                ),
                                Shadow( // bottomRight
                                    offset: Offset(-2.5, -2.5),
                                    color: Colors.white
                                ),
                                Shadow( // topRight
                                    offset: Offset(2.5, 2.5),
                                    color: Colors.white
                                ),
                                Shadow( // topLeft
                                    offset: Offset(-2.5, 2.5),
                                    color: Colors.white
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: .5, color: Colors.black),
                      SizedBox(height: 10),

                        Container(
                            color: Color.fromRGBO(243, 245, 248, 1),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column (
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        constraints: BoxConstraints.expand(
                              height: 100.0,
                            ),
                                        )],
                                  )
                                  ),
                                  new Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 50, 0 ),
                                     child: Text('10\% de desconto em \n seguro de vida!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: palleteMediumBlue,
                              fontSize: 12
                            ),
                            ),
                                    ),
                          Padding(
                           padding: EdgeInsets.fromLTRB(0, 0, 10, 0 ),
                          child:
                          FlatButton(
                          color: palleteLightBlue,
                          onPressed: () {}, 
                          child: Text(
                            'Adquirir \n 970 pontos',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontFamily: 'Rubik',),
                            )
                          )
                          )
                              ],
                            )
                          ),

                        SizedBox(height: 40,),
                      Row(
                        children: <Widget>[
                          Text(
                            "Benefícios adquiridos",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: palleteMediumBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow( // bottomLeft
                                  offset: Offset(-2.5, -2.5),
                                  color: Colors.white,
                                ),
                                Shadow( // bottomRight
                                    offset: Offset(-2.5, -2.5),
                                    color: Colors.white
                                ),
                                Shadow( // topRight
                                    offset: Offset(2.5, 2.5),
                                    color: Colors.white
                                ),
                                Shadow( // topLeft
                                    offset: Offset(-2.5, 2.5),
                                    color: Colors.white
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: .5, color: Colors.black),
                      SizedBox(height: 10),

                        Container(
                            color: Color.fromRGBO(243, 245, 248, 1),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column (
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        constraints: BoxConstraints.expand(
                              height: 100.0,
                            ),
                                        )],
                                  )
                                  ),
                                  new Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 50, 0 ),
                                     child: Text('5\% de desconto em \n seguro residencial!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: palleteMediumBlue,
                              fontSize: 12
                            ),
                            ),
                                    ),
                          Padding(
                           padding: EdgeInsets.fromLTRB(0, 0, 10, 0 ),
                          child:
                          FlatButton(
                          color: Colors.grey[600],
                          onPressed: () {}, 
                          child: Text(
                            'Adquirido',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontFamily: 'Rubik',),
                            )
                          )
                          )
                              ],
                            )
                          ),

                           Container(
                            color: Color.fromRGBO(243, 245, 248, 1),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column (
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        constraints: BoxConstraints.expand(
                              height: 100.0,
                            ),
                                        )],
                                  )
                                  ),
                                  new Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 50, 0 ),
                                     child: Text('20\$ de cashback',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: palleteMediumBlue,
                              fontSize: 12
                            ),
                            ),
                                    ),
                          Padding(
                           padding: EdgeInsets.fromLTRB(0, 0, 10, 0 ),
                          child:
                          FlatButton(
                          color: Colors.grey[600],
                          onPressed: () {}, 
                          child: Text(
                            'Adquirido',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontFamily: 'Rubik',),
                            )
                          )
                          )
                              ],
                            )
                          ),
                        
                        

])))));
  }
}