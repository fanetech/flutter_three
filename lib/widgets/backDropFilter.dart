import 'dart:ui';

import 'package:flutter/material.dart';

class BackDropFilter extends StatefulWidget {
  const BackDropFilter({super.key});

  @override
  State<BackDropFilter> createState() => _BackDropFilterState();
}

class _BackDropFilterState extends State<BackDropFilter> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage('images/test.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 20,
          right: 20,
          bottom: 100,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.blue.withOpacity(0.5),
                child: Column(children: [
                  const Text('Bienvenue sur mon application',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 20),
                  const Text('Ceci est un test de BackdropFilter',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
