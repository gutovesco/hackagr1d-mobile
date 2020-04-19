import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultarCPF extends StatefulWidget {
  @override
  _ConsultarCPFState createState() => _ConsultarCPFState();
}

class _ConsultarCPFState extends State<ConsultarCPF> {
  TextEditingController _controller = TextEditingController();

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
                    },);

                   dados = jsonDecode(response.body);
                   print("ahhhhhhhhhhhhh");
                   print(response.body);

              },
            )
          ],
        ),
      ),
    );
  }
}
