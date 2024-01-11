// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:test_app/widgets/backDropFilter.dart';
import 'package:test_app/widgets/sliverBar.dart';
// import 'package:another_carousel_pro/another_carousel_pro.dart';

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
      body: BackDropFilter(),
      // body: ListView(
      //   children: [
      //     // const CarouselPage(),
      //     Form(
      //       key: formKey,
      //       // child: CarouselPage(),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             value,
      //             style: TextStyle(fontSize: 20, color: Colors.deepPurple),
      //             textAlign: TextAlign.center,
      //           ),
      //           TextFormField(
      //             decoration: const InputDecoration(
      //               label: Text('Name'),
      //               hintText: 'Enter your name',
      //               icon: Icon(Icons.person),
      //             ),
      //             keyboardType: TextInputType.text,
      //             autocorrect: true,
      //             // onChanged: change,
      //             validator: (val) =>
      //                 (val!.isEmpty || val == null) ? 'check your name' : null,
      //             onSaved: (value) => name = value!,
      //           ),
      //           TextFormField(
      //             decoration: const InputDecoration(
      //               labelText: "phone",
      //               hintText: "Telephone",
      //               icon: Icon(
      //                 Icons.phone,
      //                 color: Colors.blue,
      //                 size: 25,
      //               ),
      //             ),
      //             keyboardType: TextInputType.number,
      //             // onChanged: change2,
      //             autofocus: true,
      //             autocorrect: true,
      //             validator: (val) => val!.isEmpty ? 'check your phone' : null,
      //             onSaved: (value) => phone = value!,
      //           ),
      //           TextFormField(
      //             decoration: const InputDecoration(
      //               labelText: "password",
      //               hintText: "password",
      //               icon: Icon(
      //                 Icons.password,
      //                 color: Colors.blue,
      //                 size: 25,
      //               ),
      //             ),
      //             keyboardType: TextInputType.text,
      //             obscureText: true,
      //             // onChanged: change3,
      //             // autofocus: true,
      //             // autocorrect: true,
      //             validator: (val) =>
      //                 val!.isEmpty ? 'check your password' : null,
      //             onSaved: (value) => password = value!,
      //           ),
      //           ElevatedButton(
      //             onPressed: () => submit(name),
      //             child: const Text('Submit'),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class CarouselPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           height: 150.0,
//           width: 300.0,
//           child: AnotherCarousel(
//             boxFit: BoxFit.cover,
//             autoplay: false,
//             animationCurve: Curves.fastOutSlowIn,
//             animationDuration: Duration(milliseconds: 1000),
//             dotSize: 6.0,
//             dotIncreasedColor: Color(0xFFFF335C),
//             dotBgColor: Colors.transparent,
//             dotPosition: DotPosition.bottomCenter,
//             dotVerticalPadding: 10.0,
//             showIndicator: true,
//             indicatorBgPadding: 7.0,
//             images: [
//               NetworkImage(
//                   'https://i.pinimg.com/originals/a2/4e/29/a24e29fc5ee1ef69ab11777f1d28641a.jpg'),
//               NetworkImage(
//                   'https://i.pinimg.com/originals/93/a0/ae/93a0aeb22c7e27da4796efb4b2297ea4.jpg'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class CarouselPage extends StatelessWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.7,
          child: const Carousel(
            hasBorderRadius: true,
            boxFit: BoxFit.cover,
            autoplay: false,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 6.0,
            dotIncreasedColor: Color(0xFFFF335C),
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.topRight,
            dotVerticalPadding: 10.0,
            dotColor: Colors.grey,
            showIndicator: true,
            indicatorBgPadding: 7.0,
            images: [
              NetworkImage(
                  'https://docs.flutter.dev/assets/images/flutter-logo-sharing.png'),
              NetworkImage(
                  'https://docs.flutter.dev/assets/images/flutter-logo-sharing.png'),
              // ExactAssetImage('assets/images/LaunchImage.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
