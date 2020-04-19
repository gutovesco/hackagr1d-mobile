import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:teste_nottest/src/components/alert_dialog.dart';
import 'package:teste_nottest/src/screens/consultar_dados_cpf/consultar_cpf.dart';
import 'package:teste_nottest/src/screens/consultar_dados_placa/consultar_placa.dart';
import 'package:teste_nottest/src/screens/home/components/card_produto/card_1.dart';
import 'package:teste_nottest/src/screens/home/components/card_produto/card_2.dart';
import 'package:teste_nottest/src/screens/home/components/card_produto/card_beneficios/card_beneficio_1.dart';
import 'package:teste_nottest/src/screens/home/components/card_produto/card_beneficios/card_beneficio_2.dart';
import 'package:teste_nottest/src/screens/home/components/information.dart';
import 'package:teste_nottest/src/screens/home/components/profile.dart';
import 'package:teste_nottest/src/screens/home/components/rewards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xff4286F4),
        index: _page,
        height: 50,
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(
            Icons.folder_open,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_basket,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialogPesquisa();
              },
            );
          }
          if (index == 1) {}
          if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BenefitsPage()));
          }
          if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          }
        },
      ),
      body: Column(
        children: <Widget>[
          appBar(),
          Expanded(child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
                child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Seus produtos",
                      style: TextStyle(color: Color(0xff4286F4), fontSize: 16),
                    ),
                  ),
                  GestureDetector(
                    child: Card1(),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BenefitsPage()));
                    },
                  ),
                  GestureDetector(
                    child: Card2(),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InformationPage()));
                    },
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Conheça nossos Benefícios",
                      style: TextStyle(color: Color(0xff4286F4), fontSize: 16),
                    ),
                  ),
                  GestureDetector(
                    child: CardBeneficio1(),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                  ),
                  GestureDetector(
                    child: CardBeneficio2(),
                    onTap: () {},
                  )
                ],
              ),
            ));
          }))
        ],
      ),
    );
  }

  Widget appBar() {
    return SafeArea(
      child: Material(
        elevation: 8,
        color: Color(0xff4286F4),
        child: Container(
          height: 60,
          padding: EdgeInsets.only(left: 16, right: 16, top: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Seja bem-vindo, Caio.",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        "Como você está?",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
