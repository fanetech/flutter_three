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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
          Text(
            'chop house',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/test.jpg', width: 200, height: 200),
              TextButton(
                onPressed: () {
                  var route = MaterialPageRoute(
                    builder: (BuildContext context) => SecondPage(
                      val1: 'chop house',
                      val2: 'images/test.jpg',
                    ),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text('details'),
              ),
            ],
          ),
          Text('Apple meat'),
          Text(
            'plant house',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/test.jpg', width: 200, height: 200),
              TextButton(
                onPressed: () {
                  var route = MaterialPageRoute(
                    builder: (BuildContext context) => SecondPage(
                      val1: 'plant house',
                      val2: 'images/test.jpg',
                    ),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text('details'),
              ),
            ],
          ),
          Text('Apple meat')
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

class SecondPage extends StatelessWidget {
  final val1;
  final val2;
  const SecondPage({super.key, this.val1, this.val2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Second Page'),
      ),
      body: Center(
        child: ListView(
          children: [
            Text(
              '$val1',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('$val2', width: 200, height: 200),
              ],
            ),
            Text(
                'Apple meat lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud'),
          ],
        ),
      ),
    );
  }
}
