import 'package:flutter/material.dart';
import 'package:teste_nottest/src/screens/consultar_dados_cpf/consultar_cpf.dart';
import 'package:teste_nottest/src/screens/consultar_dados_placa/consultar_placa.dart';

class AlertDialogPesquisa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Escolher pesquisa'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConsultarPlaca()));
                },
                              child: ListTile(
                  title: Text("Pesquisar placa"),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConsultarCPF()));
                },
                              child: ListTile(
                  title: Text("Pesquisar cpf"),
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}