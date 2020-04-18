import 'package:flutter/material.dart';

class CardBeneficio2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
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
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Icon(
                    Icons.sentiment_satisfied,
                    size: 21,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Text("Receba promoções exclusivas! Seja premiado conforme seu histórico.",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}