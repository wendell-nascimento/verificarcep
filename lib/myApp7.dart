import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


class MyApp7 extends StatefulWidget {
  @override
  _MyApp7State createState() => _MyApp7State();
}

class _MyApp7State extends State<MyApp7> {
  TextEditingController _controller = TextEditingController();
  String _info = "***";

  int _verificaCEP(String CEP){
    int numero = int.tryParse(CEP);
    return numero;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("Verifica CEP"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: _controller,
              maxLength: 8,
              decoration: InputDecoration(
                hintText: "Coloque o CEP. Exemplo: 69000000",
              ),
            ),

            Center(child: Text(_info, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),

            RaisedButton(
                child: Text("Verificar", style: TextStyle(fontSize: 20,),),
                color: Colors.yellow,
                onPressed: ()  {

              int cep = _verificaCEP(_controller.text);
              if((cep == null) || (_controller.text.characters.length != 8)){
                print("CEP INVÁLIDO: $cep");
                setState(() {
                  _info = "CEP INVÁLIDO";
                });
              }
              else{
                pesquisar(_controller.text);
              }
            }),
          ],
        ),
      ),
    );
  }

  pesquisar(String CEP) async{
    String url ="https://viacep.com.br/ws/$CEP/json/";

    print("Irei verificar.. só um minuto meu chapa");

    http.Response response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);



      setState(() {
        String check = dados["bairro"];

        _info = "Verificando...";

        if(check != null){
          _info = "Bairro: ${dados["bairro"]} \n"
                  "Cidade: ${dados["localidade"]} \n"
                  "Logradouro: ${dados["logradouro"]}";
        }
        else{
          _info = "ERROR";
        }
      });
    print(response.body);
  }
}


