import 'dart:convert';

import 'package:appproductos/update_producto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class view_data extends StatefulWidget {
  view_data({Key? key}) : super(key: key);
  @override
  State<view_data> createState() => _view_dataState();
}

class _view_dataState extends State<view_data> {
  List userdata = [];

  Future<void> delrecord(String id) async {
    try {
      String uri = "http://10.0.2.2/Productos/delete_producto.php";
      var res = await http.post(Uri.parse(uri), body: {"id": id});
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("Registro borrado");
      } else {
        print("Algun problema");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getrecord() async {
    String uri = "http://10.0.2.2/Productos/view_datau.php";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PRODUCTOS REGISTRADOS")),
      body: ListView.builder(
          itemCount: userdata.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => update_record(
                                userdata[index]["id_producto"],
                                userdata[index]["id_imagen"],
                                userdata[index]["nombre"],
                                userdata[index]["descripcion"],
                                userdata[index]["cantidad"],
                                userdata[index]["precio"])));
                  },
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.amber,
                  ),
                  title: Text(userdata[index]["nombre"]),
                  subtitle: Text(userdata[index]["descripcion"]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.amber,
                    onPressed: () {
                      delrecord(userdata[index]["id_producto"]);
                    },
                  )),
            );
          }),
    );
  }
}
