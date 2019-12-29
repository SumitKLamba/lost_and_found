import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Color(0xFF57606F)),),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        bottom: TabBar(
//          unselectedLabelColor: Color(0x4F2C3E50),
//          labelColor: Color(0xFF57606F),
//          tabs: [
//            new Tab(
//              icon: Image.asset('images/LostIcon.png'),
//              child: Text(
//                'Lost',
//                style: TextStyle(
//                  color: Colors.white,
//                ),
//              ),
//            ),
//            new Tab(
//              icon: Image.asset('images/FoundIcon.png'),
//              child: Text(
//                'Found',
//                style: TextStyle(
//                  color: Colors.white,
//                ),
//              ),
//            ),
//          ],
//          controller: _tabController,
//        ),
//      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFF57606F),
              height: 117.4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width/2.6, bottom: 8),
                      child: Image.asset(
                        'images/app_bar_icon.png',
                        scale: 1.5,
                      ),
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
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 60,
                          color: Color(0xFF57606F),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: MediaQuery.of(context).size.width/8,),
                              Image.asset('images/LostIcon.png'),
                              SizedBox(width: 15,),
                              Text('Lost',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),)
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 60,
                          color: Color(0xFF4A5666),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: MediaQuery.of(context).size.width/8,),
                              Image.asset('images/FoundIcon.png'),
                              SizedBox(width: 15,),
                              Text('Found',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF2C3E50),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Container(
                      height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Stack(
                        children: <Widget>[
                          Image.asset('images/box.jpg'),
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    Container(
                      height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Stack(
                        children: <Widget>[
                          Image.asset('images/box.jpg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}
