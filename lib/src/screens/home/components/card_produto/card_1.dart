import 'package:flutter/material.dart';

class Card1 extends StatefulWidget {
  @override
  _Card1State createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Material(
        elevation: 2,
        color: Color(0xff4286F4),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Container(
            height: 180,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Text("Que tal ver nossas melhores ofertas?",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                              "Buscando seguro para o seu Auto, Residência ou Vida? Que tal conferir nossas melhores opções de seguro?",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Icon(
                    Icons.verified_user,
                    size: 100,
                    color: Colors.white,
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
