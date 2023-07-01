import 'dart:convert';
import 'dart:html';

import 'package:datasiswa/tambah.dart';
import 'package:datasiswa/edit.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listdata = [];

  Future _getdata() async {
    try {
      final respone =
          await http.get(Uri.parse('http://192.168.67.58/backend_datasiswa/list.php'));
      if (respone.statusCode == 200) {
        final data = jsonDecode(respone.body);
        setState(() {
          _listdata = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    print(_listdata);
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF265D61),
          leading: Icon(Icons.school_outlined),
          title: Text('Data Mahasiswa'),
        ),
        body: ListView.builder(
itemCount: _listdata.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    //routing into edit page
                    //we pass the id note
                    MaterialPageRoute(
                        builder: (context) => Edit(
                              id: _listdata[index]['id'],
                            )));
              },
              child: Card(
                child: ListTile(
                title: Text(_listdata[index]['nama']),
                subtitle: Text(_listdata[index]['nim'], ),
                trailing:  Text(_listdata[index]['alamat'], ),
                ),
              ),
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF205D61),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                //routing into add page
                MaterialPageRoute(builder: (context) => Tambah()));
          },
        ),
      ),
    );
  }
}

                // title: Text(_listdata[index]['nama']),
                // subtitle: Text(_listdata[index]['nim'], ),
                // trailing:  Text(_listdata[index]['alamat'], ),