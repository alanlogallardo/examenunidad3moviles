import 'package:examenunidad3/User.dart';
import 'package:flutter/material.dart';

import 'controllers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roaster Peleadores UFC',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: MyHomePage(title: 'Roaster Peleadores UFC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nombre = "Tio";
  String categoria = "Alan";
  List<Usuario> response = [];

  _MyHomePageState() {
    getUser().then((value) {
      response = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image(
                  image: AssetImage('assets/ufc.jpg'),
                  height: 140,
                ),
              ),
            ],
          ),
          Column(
            children: [
              TextField(
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Nombre de peleador',
                  labelText: 'Nombre de peleador',
                ),
                onChanged: (valor) {
                  if (valor.isEmpty) {
                    nombre = "";
                    return;
                  }
                  setState(() {
                    nombre = valor;
                  });
                },
              ),
              TextField(
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Categoria',
                  labelText: 'Categoria',
                ),
                onChanged: (valor) {
                  if (valor.isEmpty) {
                    categoria = "";
                    return;
                  }
                  setState(() {
                    categoria = valor;
                  });
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: response
                .map((e) => Text(
                      'Número Peleador: ${e.id} Nombre y Categoria: ${e.nombre} --> ${e.categoria}',
                      style: TextStyle(fontSize: 20),
                    ))
                .toList(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await createUser(nombre, categoria);
          response = await getUser();
          setState(() {});
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
