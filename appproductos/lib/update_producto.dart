import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class update_record extends StatefulWidget {
  String id_producto;
  String id_imagen;
  String nombre;
  String descripcion;
  String cantidad;
  String precio;
  update_record(this.id_producto, this.id_imagen,this.nombre, this.descripcion, this.cantidad,
      this.precio);

  @override
  State<update_record> createState() => _update_recordState();
}

class _update_recordState extends State<update_record> {
  TextEditingController id_producto = TextEditingController();
  TextEditingController id_imagen = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController cantidad = TextEditingController();
  TextEditingController precio = TextEditingController();

  Future<void> updaterecord() async {
    try {
      String uri = "http://10.0.2.2/Productos/update_producto.php";
      var res = await http.post(Uri.parse(uri), body: {
        "id_producto": id_producto.text,
        "id_imagen": id_imagen.text,
        "nombre": nombre.text,
        "descripcion": descripcion.text,
        "cantidad": cantidad.text,
        "precio": precio.text
      });
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("Update");
      } else {
        print("No Update");
      }
    } catch (e) {
      print(e);
    }
  } //inicializar el estado

  @override
  void initState() {
    id_producto.text = widget.id_producto;
    id_imagen.text = widget.id_imagen;
    nombre.text = widget.nombre;
    descripcion.text = widget.descripcion;
    cantidad.text = widget.cantidad;
    precio.text = widget.precio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ACTUALIZAR REGISTRO'),
      ),
      body: Column(children: [
         Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: id_imagen,
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text('Ingrese el id_imagen')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: nombre,
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text('Ingrese el nombre')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: descripcion,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Ingrese la descripcion')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: cantidad,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Ingrese la cantidad')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: precio,
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text('Ingrese el precio')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              updaterecord();
            },
            child: Text('Update'),
          ),
        )
      ]),
    );
  }
}
