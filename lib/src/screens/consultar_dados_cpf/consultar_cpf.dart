import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultarCPF extends StatefulWidget {
  @override
  _ConsultarCPFState createState() => _ConsultarCPFState();
}

class _ConsultarCPFState extends State<ConsultarCPF> {
  TextEditingController _controller = TextEditingController();

  Map<String, dynamic> teste;

  Map<String, dynamic> dados;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Concultar CPF/CNPJ"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 50,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: "Digite seu CPF ou CNPJ"),
              ),
            ),
            RaisedButton(
              child: Text("Consultar"),
              onPressed: () async {
                final response = await http.get(
                  'HTTPS://gateway.gr1d.io/sandbox/procob/v1/consultas/v2/L0001/${_controller.text}',
                  headers: {
                    'Content-type': 'application/json',
                    'X-Api-Key': 'b3e7c74c-5d76-46ed-9e98-da89ae257c7d',
                  },
                );

                print(dados);

                setState(() {
                  dados = jsonDecode(response.body);
                });
              },
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
      try{
       dadosEncontrado = dados["content"]["nome"]["conteudo"];
      }catch(e){
        dadosEncontrado = null;
      }

      if(dadosEncontrado == null){
        return Container(
          child: Text("Sim, deu bosta, como vc n adivinhou?"),
        );
      }else{
        return Material(
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
                    Text("Nome: "),
                    Text(dadosEncontrado["nome"])
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Text("Tipo documento: "),
                    Text(dadosEncontrado["tipo_documento"])
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Text("Documento: "),
                    Text(dadosEncontrado["documento"])
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Text("Data receita: "),
                    Text(dadosEncontrado["situacao_receita_data"])
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Text("Receita: "),
                    Text(dadosEncontrado["situacao_receita"])
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Text("Estrangeiro: "),
                    Text(dadosEncontrado["estrangeiro"]["estrangeiro"] == "NAO"
                        ? "Não"
                        : "Desconhecido")
                  ],
                ),
              ],
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
