// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Geo> geos = [];

  @override
  void initState() {
    geos = Geo.getGeo();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  DataTable dataTab() {
    return DataTable(
      columns: [
        DataColumn(
            label: Text(
          "Country",
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 20),
        )),
        DataColumn(
            label: Text(
          "Capital city",
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 20),
        )),
        DataColumn(
            label: Text(
          "City",
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 20),
        )),
      ],
      rows: geos
          .map((geo) => DataRow(cells: [
                DataCell(Text(geo.country)),
                DataCell(Text(geo.capital)),
                DataCell(Text(geo.city)),
              ]))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView(
        children: [
          dataTab(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Geo {
  String country;
  String capital;
  String city;

  Geo(this.country, this.capital, this.city);

  static List<Geo> getGeo() {
    return <Geo>[
      Geo('canada', 'Ottawa', 'America'),
      Geo('USA', 'washington', 'America'),
      Geo('China', 'Pekin', 'Asia'),
      Geo('Burkina Faso', 'Ouagadougou', 'Africa'),
      Geo('Togo', 'Lome', 'Africa'),
      Geo('RCI', 'Abijan', 'Africa'),
      Geo('Bresil', 'Brasilia', 'America'),
      Geo('canada', 'Ottawa', 'America'),
      Geo('USA', 'washington', 'America'),
      Geo('China', 'Pekin', 'Asia'),
      Geo('Burkina Faso', 'Ouagadougou', 'Africa'),
      Geo('Togo', 'Lome', 'Africa'),
      Geo('RCI', 'Abijan', 'Africa'),
      Geo('Bresil', 'Brasilia', 'America'),
    ];
  }
}
