import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultarPlaca extends StatefulWidget {
  @override
  _ConsultarPlacaState createState() => _ConsultarPlacaState();
}

class _ConsultarPlacaState extends State<ConsultarPlaca> {
  TextEditingController _controller = TextEditingController();

  Map<String, dynamic> teste;

  Map<String, dynamic> dados;

  String msg = "NAO CONSTAM INFORMACOES NA BASE CONSULTADA";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados básicos do veículo"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                height: 60,
                child: TextField(
                  maxLength: 7,
                  controller: _controller,
                  decoration:
                      InputDecoration(hintText: "Digite a placa do veículo"),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Consultar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  final response = await http.post(
                      'HTTPS://gateway.gr1d.io/sandbox/infocar/codificacao/v1/INFOCAR_CODIFICACAO',
                      headers: {
                        'X-Api-Key': 'de86d264-f778-420c-9f69-6466694345a6',
                      },
                      body: jsonEncode({
                        "parameters": {"dado": "${_controller.text}", "tipo": "PLACA"}
                      }));

                  setState(() {
                    dados = jsonDecode(response.body);
                  });
                },
              ),
            ),
            Expanded(child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              print(viewportConstraints);
              return SingleChildScrollView(
                  child: Container(
                child: Column(
                  children: <Widget>[conteudoConsultarCep(viewportConstraints)],
                ),
              ));
            }))
          ],
        ),
      ),
    );
  }

  Widget conteudoConsultarCep(BoxConstraints viewportConstraints) {
    if (dados != null) {
      var dadosEncontrado;
      try {
        print(dados);
        dadosEncontrado = dados["soap:Envelope"]["soap:Body"]["CodificacaoFIPEResponse"]["CodificacaoFIPEResult"]["INFO-XML"]["RESPOSTA"]["INFOCAR_CODIFICACAO_XML"]["DADOS_DO_VEICULO"];
      } catch (e) {
        dadosEncontrado = null;
      }

      if (dadosEncontrado == null) {
        return Container(
          height: viewportConstraints.maxHeight,
          width: viewportConstraints.maxWidth,
          child: Center(child: Text("Placa incorreta!")),
        );
      } else {
        return Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: viewportConstraints.maxWidth * 0.9,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Placa: "),
                        Text(dadosEncontrado["PLACA"])
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text("Modelo: "),
                        Text(dadosEncontrado["MARCA_MODELO"])
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text("Montagem: "),
                        Text(dadosEncontrado["TIPO_MONTAGEM"])
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text("Número do moto: "),
                        Text(dadosEncontrado["N_MOTOR"]  == msg ? "---" : dadosEncontrado["N_MOTOR"])
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text("Cor: "),
                        Text(dadosEncontrado["COR"])
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    } else {
      return Container(
        child: Center(
          child: Container(
            child: Text("Aguardando pesquisa..."),
          ),
        ),
      );
    }
  }
}
