import 'package:flutter/material.dart';

class SliverBar extends StatefulWidget {
  const SliverBar({super.key});

  @override
  State<SliverBar> createState() => _SliverBarState();
}

class _SliverBarState extends State<SliverBar> {
  Widget resto(String menu, Color color, String image) {
    return Container(
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(image),
          Text(menu),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            'Welcome to my app',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          pinned: true,
          floating: true,
          expandedHeight: 200,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'images/test.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 150,
          delegate: SliverChildListDelegate([
            resto('Menu 1', Colors.red, 'images/test.jpg'),
            resto('Menu 2', Colors.blue, 'images/test.jpg'),
            resto('Menu 3', Colors.green, 'images/test.jpg'),
            resto('Menu 4', Colors.yellow, 'images/test.jpg'),
            resto('Menu 5', Colors.purple, 'images/test.jpg'),
            resto('Menu 5', Colors.purple, 'images/test.jpg'),
            resto('Menu 5', Colors.purple, 'images/test.jpg'),
            resto('Menu 5', Colors.purple, 'images/test.jpg'),
            resto('Menu 5', Colors.purple, 'images/test.jpg'),
            resto('Menu 5', Colors.purple, 'images/test.jpg'),
            resto('Menu 5', Colors.purple, 'images/test.jpg'),
          ]),
        )
      ],
    );
  }
}
