import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'contsnts.dart';

class DataScreen extends StatefulWidget {
  DataScreen({Key? key, this.randomData}) : super(key: key);
  var randomData;
  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  List? names = [];
  List? avatars = [];
  List? ids = [];
  List? dates = [];

  @override
  void initState() {
    super.initState();
    jsonDecode(widget.randomData);
  }

  void jsonDecode(var data) {
    for (int i = 0; i < 100; i++) {
      names?.add(data[i]['name']);
      avatars?.add(data[i]['avatar']);
      ids?.add(data[i]['id']);
      dates?.add(data[i]['createdAt']);
    }
    setState(() {
      names;
      avatars;
      ids;
      dates;
    });
  }

  List<Container> generateContainer() {
    List<Container> containers = [];
    for (int i = 0; i < 100; i++) {
      var a = Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.all(20.0),
        color: Colors.blueGrey,
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              child: ClipOval(
                child: Image.network(
                  avatars![i],
                ),
              ),
            ),
            Text(
              'Name: ${names![i]}',
              style: dataStyle,
            ),
            Text(
              'ID: ${ids![i]}',
              style: dataStyle,
            ),
            Text(
              'CreatedAt: ${dates![i]}',
              style: dataStyle,
            ),
          ],
        ),
      );
      containers.add(a);
    }
    return containers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Random Data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: generateContainer(),
        ),
      ),
    );
  }
}
