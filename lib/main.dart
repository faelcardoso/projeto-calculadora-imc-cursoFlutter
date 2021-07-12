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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingValue infoText = TextEditingValue();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe os seus dados:";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe os seus dados:";
    });
  }

  void _calcIMC() {
    setState(() {
      //O set state é usado sempre quando teremos alguma modificação em nosso layout.
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

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
                  _resetFields();
                }),
          ]),
      backgroundColor: Color(0xFFEAEAEA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Icon(
              Icons.person,
              size: 150.0,
              color: Color(0xFF0000535),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              child: Text(
                _infoText,
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
                ),
              ),
            ),
          ),
          Center(
            // First Text Field
            child: Padding(
              padding: EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 40.0,
                bottom: 35.0,
              ),
              child: Material(
                borderRadius: BorderRadius.circular(50),
                elevation: 10,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira o seu Peso";
                      }
                      return null;
                    },
                    controller: weightController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF0000535),
                      prefixIcon:
                          Icon(Icons.fitness_center, color: Color(0xFFEAEAEA)),
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
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    style: TextStyle(
                      color: Color(0xFFEAEAEA),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            // Second Text Field
            child: Padding(
              padding: EdgeInsets.only(
                left: 40.0,
                right: 40.0,
              ),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(50),
                child: Form(
                  child: TextFormField(
                    controller: heightController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF0000535),
                      prefixIcon: Icon(Icons.accessibility_new,
                          color: Color(0xFFEAEAEA)),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(
                        color: Color(0xFFEAEAEA),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      labelText: "Altura (cm)",
                      hintText: "Digite a sua altura",
                      hintStyle: TextStyle(
                        color: Color(0xFFEAEAEA),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    style: TextStyle(
                      color: Color(0xFFEAEAEA),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            // Calculate Button
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: ElevatedButton(
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        color: Color(0xFFEAEAEA),
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calcIMC();
                        }},
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(100.0, 55.0)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF0000535)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
