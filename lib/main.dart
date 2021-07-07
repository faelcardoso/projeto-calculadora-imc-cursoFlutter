import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculadora de IMC',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Calculadora IMC"),
            centerTitle: true,
            backgroundColor: Color(0xFF0000535),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    debugPrint("Funcionou!");
                  })
            ]),
        backgroundColor: Color(0xFFEAEAEA),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 150.0,
                    color: Color(0xFF0000535),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Padding(
                padding: 
                  EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                    top: 20.0,
                    bottom: 35.0,
                  ),
                child: 
                  Form(
                    child: 
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.numberWithOptions(
                          signed: true
                        ),
                        decoration: 
                          InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: 
                              TextStyle(
                                color: 
                                  Color(0xFF0000535),
                                fontSize: 
                                  18, 
                              ),
                            labelText: 
                              "Peso (Kg)",
                            hintText: "Digite o seu peso em quilogramas", 
                            hintStyle: TextStyle(
                              color: Color(0xFF0000535),
                            ),
                            enabledBorder: 
                              OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Color(0xFF0000535),
                                width: 4.0,)
                              ),
                            focusedBorder: 
                              OutlineInputBorder(
                                borderSide:
                                  BorderSide(
                                    color: Color(0xFF0000535),
                                    width: 4.0,
                                  ),
                                borderRadius: BorderRadius.circular(25.0),)
                        ),
                        style:
                          TextStyle(
                            color: Color(0xFFEAEAEA),
                          ),
                      ),),
                ),
                Padding(
                padding: 
                  EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                    ),
                child: 
                  Form(
                    child: 
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.numberWithOptions(
                          signed: true
                        ),
                        decoration: 
                          InputDecoration(
                            labelText:
                              "Altura (m)",
                              labelStyle: 
                              TextStyle(
                                color: Color(0xFF0000535),
                              ),
                            hintText: "Digite a sua altura em metros",
                            hintStyle: TextStyle(
                              color: Color(0xFF0000535)
                            ),
                            fillColor: 
                              Colors.white,
                            enabledBorder: 
                              OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Color(0xFF0000535))
                              ),
                              focusedBorder: 
                              OutlineInputBorder(
                                borderSide:
                                  BorderSide(
                                    color: Color(0xFF0000535),
                                  ),
                                borderRadius: BorderRadius.circular(25.0),),
                            focusColor: Color(0xFFFFD290)
                        ),
                        style: 
                          TextStyle(
                            color: Colors.black,
                          ),
                      ),),
                )
            ]));
  }
}
