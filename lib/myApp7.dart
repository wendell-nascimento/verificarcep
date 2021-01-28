import 'package:flutter/material.dart';

class MyApp7 extends StatefulWidget {
  @override
  _MyApp7State createState() => _MyApp7State();
}

class _MyApp7State extends State<MyApp7> {
  TextEditingController _controller = TextEditingController();

  int _verificaCEP(String CEP){
    int numero = int.tryParse(CEP);
    return numero;
  }

  String _info = "***";

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
              controller: _controller,
              maxLength: 8,
              decoration: InputDecoration(
                hintText: "Coloque o CEP. Exemplo: 69000000",
              ),
            ),
            Center(child: Text(_info)),
            RaisedButton(
                child: Text("Verificar", style: TextStyle(fontSize: 20,),),
                color: Colors.yellow,
                onPressed: () {
              //print(_controller.text);
              int cep = _verificaCEP(_controller.text);
              if((cep == null) || (cep.toString().length != 8)){
                print("CEP INVÁLIDO");
                setState(() {
                  _info = "CEP INVÁLIDO";
                });
              }
              else{
                setState(() {
                    _info = "ESTE CEP PODE SER VERIFICADO";

                  /**
                   * IMPLEMENTAR
                   */
                });
              }
            }),
          ],
        ),
      ),
    );
  }
}
