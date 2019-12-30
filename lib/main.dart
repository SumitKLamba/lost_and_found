import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF57606F)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(children: <Widget>[
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 2.6, bottom: 8),
              child: Image.asset(
                'images/app_bar_icon.png',
                scale: 1.5,
              ),
            ),
            left: -32,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '!Found',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ]),
        bottom: TabBar(
          indicator:  CustomTabIndicator(),
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Color(0xFFFFFFFF),
          tabs: <Tab>[
            Tab(
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/LostIcon.png', scale: 1.2),
                      Text(
                        "Lost",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.overline.color),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/FoundIcon.png', scale: 1.2),
                      Text(
                        "Found",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.overline.color),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          new TabScreen("Lost Wale Items"),
          new TabScreen("Found Wale Items"),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}

class TabScreen extends StatelessWidget {
  TabScreen(this.listType);
  final String listType;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              listType,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {

  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged);
  }

}

class _CustomPainter extends BoxPainter {

  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size;
    final Paint paint = Paint();
    paint.color = Color(0x1F000000);
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(0.0)), paint);
  }

}