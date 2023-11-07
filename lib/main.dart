import 'package:flutter/material.dart';
import 'package:test_app/widgets/gridViewComponent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                child: Icon(Icons.ac_unit),
              ),
              Tab(
                child: Icon(Icons.ac_unit_sharp),
              ),
              Tab(
                child: Icon(Icons.access_alarm),
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              Card(
                  child:
                      Image.asset('images/test.jpg', height: 100, width: 100)),
              PageView.builder(
                itemBuilder: (BuildContext buildcontext, int index) =>
                    PageWidget(pageinfo: pages[index]),
                itemCount: pages.length,
              ),
              Card(
                  child:
                      Image.asset('images/test.jpg', height: 100, width: 100)),
            ],
          ),
          //  const GridViewComponent(),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

class Pageinfo {
  final String title;
  final String description;
  final String image;

  Pageinfo(this.title, this.description, this.image);
}

final List<Pageinfo> pages = [
  Pageinfo('Page 1', 'This is page 1', 'images/test.jpg'),
  Pageinfo('Page 2', 'This is page 2', 'images/test.jpg'),
  Pageinfo('Page 3', 'This is page 3', 'images/test.jpg'),
  Pageinfo('Page 4', 'This is page 4', 'images/test.jpg'),
  Pageinfo('Page 5', 'This is page 5', 'images/test.jpg'),
  Pageinfo('Page 6', 'This is page 6', 'images/test.jpg'),
  Pageinfo('Page 7', 'This is page 7', 'images/test.jpg'),
  Pageinfo('Page 8', 'This is page 8', 'images/test.jpg'),
  Pageinfo('Page 9', 'This is page 9', 'images/test.jpg')
];

class PageWidget extends StatefulWidget {
  final Pageinfo pageinfo;

  const PageWidget({super.key, required this.pageinfo});

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Row(
            children: [
              Text(
                widget.pageinfo.title,
                style: TextStyle(color: Colors.blue, fontSize: 25),
              )
            ],
          ),
          SizedBox(height: 10),
          Image.asset(
            widget.pageinfo.image,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            widget.pageinfo.description,
            style: TextStyle(color: Colors.blue, fontSize: 25),
          )
        ],
      ),
    );
  }
}
