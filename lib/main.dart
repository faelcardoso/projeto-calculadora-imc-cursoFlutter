import 'package:flutter/services.dart';
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
            actions: <Widget>[ IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    debugPrint("Reset");
                  }),
            ]),
        backgroundColor: Color(0xFFEAEAEA),
        body: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Icon(Icons.person,
                    size: 150.0,
                    color: Color(0xFF0000535),),),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Text("Informe os seus Dados:",
                style: TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(-2.0, 2),
                      blurRadius: 10,
                      color: Colors.black38,
                    )
                  ],
                  color: Color(0xFF0000535),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),),
              ),
              Center( // First Text Field
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                    top: 40.0,
                    bottom: 35.0,),
                  child: Material(
                    borderRadius: BorderRadius.circular(50),
                    elevation: 10,
                    child: TextFormField(
                          inputFormatters: [LengthLimitingTextInputFormatter(5),],
                          keyboardType: TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF0000535),
                            prefixIcon: Icon(Icons.fitness_center, color: Color(0xFFEAEAEA)),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(
                                color: Color(0xFFEAEAEA),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                ),
                            labelText: "Peso (Kg)",
                            hintText: "Digite o seu peso", 
                            hintStyle: TextStyle(
                                color: Color(0xFFEAEAEA),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),),),
                        style: TextStyle(
                            color: Color(0xFFEAEAEA),
                            fontWeight: FontWeight.bold,),
                  ),),
                ),
              ),
              Center( // Second Text Field
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(50),
                    child: TextFormField(
                          inputFormatters: [LengthLimitingTextInputFormatter(5),],
                          keyboardType: TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF0000535),
                            prefixIcon: Icon(Icons.accessibility_new, color: Color(0xFFEAEAEA)),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(
                                color: Color(0xFFEAEAEA),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                ),
                            labelText: "Altura (m)",
                            hintText: "Digite a sua altura", 
                            hintStyle: TextStyle(
                                color: Color(0xFFEAEAEA),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),),),
                        style: TextStyle(
                            color: Color(0xFFEAEAEA),
                            fontWeight: FontWeight.bold,),
                  ),

                  ),
                ),
              ),
                   Center( // Calculate Button
                     child: Column(
                       children: <Widget> [
                         Padding(
                           padding: EdgeInsets.all(40.0),
                           child: ElevatedButton(
                          child: Text("Calcular", 
                            style: TextStyle(
                              color: Color(0xFFEAEAEA),
                              fontSize: 18,),),
                          onPressed: () { // Calc Function
                             debugPrint("Calculou!");},
                           style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(100.0, 55.0)),
                            backgroundColor: MaterialStateProperty.all(Color(0xFF0000535)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            )),
                           ),
                           ),),
                       ],),),
                   ]
                ,)
          );
  }
}
