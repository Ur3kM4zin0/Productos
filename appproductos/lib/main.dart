import 'dart:convert';

import 'package:appproductos/viewproductos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController id_imagen = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController cantidad = TextEditingController();
  TextEditingController precio = TextEditingController();

  Future<void> insertrecord() async {
    if (id_imagen.text != "" ||
        nombre.text != "" ||
        descripcion.text != "" ||
        cantidad.text != "" ||
        precio.text != "") {
      try {
        String uri = "http://10.0.2.2/Productos/insert_producto.php";
        var res = await http.post(Uri.parse(uri), body: {
          "id_imagen": id_imagen.text,
          "nombre": nombre.text,
          "descripcion": descripcion.text,
          "cantidad": cantidad.text,
          "precio": precio.text
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Registro insertados");
          id_imagen.text = "";
          nombre.text = "";
          descripcion.text = "";
          cantidad.text = "";
          precio.text = "";
        } else {
          print("some issue");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("por favor llene todos los campos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('REGISTRAR PRODUCTO'),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                controller: id_imagen,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Ingrese el id_imagen'))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                controller: nombre,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Ingrese el nombre'))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                controller: descripcion,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Ingrese la descripcion'))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                controller: cantidad,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Ingrese la cantidad'))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                controller: precio,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Ingrese el precio'))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                insertrecord();
              },
              child: Text('Insertar'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => view_data()));
                    },
                    child: Text("Mostrar"));
              },
            ),
          )
        ]),
      ),
    );
  }
}
