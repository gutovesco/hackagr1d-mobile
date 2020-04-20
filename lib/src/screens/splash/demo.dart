
import 'package:flutter/material.dart';
import 'package:teste_nottest/src/screens/splash/splash.dart';

import 'gooey_carousel.dart';

class GooeyEdgeDemo extends StatefulWidget {
  GooeyEdgeDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GooeyEdgeDemoState createState() => _GooeyEdgeDemoState();
}

class _GooeyEdgeDemoState extends State<GooeyEdgeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GooeyCarousel(
        children: <Widget>[
          ContentCard(
            color: 'Red',
            altColor: Color(0xFF4259B2),
            title: "Diversas opções de planos e pacotes! Como Seguro Auto, Seguro Residencial e Seguro de vida",
            subtitle: '',
          ),
          ContentCard(
            color: 'Yellow',
            altColor: Color.fromRGBO(66,182,66, 100),
            title: "Acumule pontos pelo seu desempenho e troque por benefícios!",
            subtitle:
            '',
          ),
          ContentCard(
            color: 'Blue',
            altColor: Color(0xFFFFB138),
            title: "Dentro da plataforma você segue pontuando caso mantenha os pagamentos em dia, renove o seguro e não ocorra nenhum sinistro.",
            subtitle:
            '',
          ),
        ],
      ),
    );
  }
}