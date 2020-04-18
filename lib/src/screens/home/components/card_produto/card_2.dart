import 'package:flutter/material.dart';

class Card2 extends StatefulWidget {
  @override
  _Card2State createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Container(
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Icon(
                    Icons.attach_money,
                    size: 100,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Text("Ative um seguro e receba promoções exclusivas!",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                              "Ao fazer parte do *Nome do Projeto*, você recebe uma pontuação de acordo com seu histórico. Receba promoções, descontos e muito mais!",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
