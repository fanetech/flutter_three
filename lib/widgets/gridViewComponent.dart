import 'package:flutter/material.dart';

class GridViewComponent extends StatefulWidget {
  const GridViewComponent({super.key});

  @override
  State<GridViewComponent> createState() => _GridViewComponentState();
}

class _GridViewComponentState extends State<GridViewComponent> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.1,
        mainAxisSpacing: 0,
        children: List.generate(10, (index) {
          return Image.asset('images/test.jpg');
        }),
      );
    });
  }
}
