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
  String name = '';
  String value = '';
  String phone = '';
  String password = '';
  final formKey = GlobalKey<FormState>();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void submit(String a) {
    // print(a);
    // setState(() {
    //   value = 'Envoyé';
    // });
    validationForm();
  }

  void change(String val) {
    setState(() {
      name = val;
    });
  }

  void change2(String val) {
    setState(() {
      phone = val;
    });
  }

  void change3(String val) {
    setState(() {
      password = val;
    });
  }

  validationForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      debugPrint('name: $name');
      debugPrint('phone: $phone');
      debugPrint('password: $password');
      formKey.currentState!.reset();
    } else {
      debugPrint('not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Name'),
                hintText: 'Enter your name',
                icon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.text,
              autocorrect: true,
              // onChanged: change,
              validator: (val) =>
                  (val!.isEmpty || val == null) ? 'check your name' : null,
              onSaved: (value) => name = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "phone",
                hintText: "Telephone",
                icon: Icon(
                  Icons.phone,
                  color: Colors.blue,
                  size: 25,
                ),
              ),
              keyboardType: TextInputType.number,
              // onChanged: change2,
              autofocus: true,
              autocorrect: true,
              validator: (val) => val!.isEmpty ? 'check your phone' : null,
              onSaved: (value) => phone = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "password",
                hintText: "password",
                icon: Icon(
                  Icons.password,
                  color: Colors.blue,
                  size: 25,
                ),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              // onChanged: change3,
              // autofocus: true,
              // autocorrect: true,
              validator: (val) => val!.isEmpty ? 'check your password' : null,
              onSaved: (value) => password = value!,
            ),
            ElevatedButton(
              onPressed: () => submit(name),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
