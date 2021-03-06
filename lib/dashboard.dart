import 'package:flutter/material.dart';
import 'package:lost_and_found/listViewFoundCard.dart';
import 'package:lost_and_found/listViewLostCard.dart';
import 'package:lost_and_found/onClickFAB.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  Color txtColor = Colors.white;

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
          indicator: CustomTabIndicator(),
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Lost",
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 1.3,
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Found",
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 1.3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(
              0xFF2D3E50), //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: [
                    Text('+91XXXXXXXXXX',style: TextStyle(
                      color: txtColor,
                    ),),
                    SizedBox(height: 10),
                    CircleAvatar(radius: 36,),
                    SizedBox(height: 10),
                    Container(
                      height: 25,
                      width: 45,
                      child: Center(
                        child: Text('Edit',
                        style: TextStyle(
                          color: txtColor,
                        ),),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF57606F),
                ),
              ),
              ListTile(
                title: Text('LogOut',style: TextStyle(
                  color: txtColor,
                ),),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          ListViewLostCard(),
          ListViewFoundCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OnClickFAB();
            }));
          }),
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
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(0.0)), paint);
  }
}
