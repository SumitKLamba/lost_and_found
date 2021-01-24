import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lost_and_found/dashboard.dart';
import 'package:lost_and_found/main.dart';

class OnClickCard extends StatefulWidget {
  @override
  _OnClickCardState createState() => _OnClickCardState();
}

class _OnClickCardState extends State<OnClickCard>{
  Color txtColor = Colors.white;
  String fontFamily = 'Raleway';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
        children: <Widget>[
          DashBoard(),
          Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                  child: Container(
                    child: Column(
                    children: <Widget>[
                      SizedBox(height: 80,),
                      Container(
                          height: MediaQuery.of(context).size.height / 2.7,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Image.asset('images/box.jpg',
                          fit: BoxFit.fill,
                          ),),
                      SizedBox(height: 35,),
                      Text('Pencil Box',
                        style: TextStyle(
                          fontSize: 26,
                          color: txtColor,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w700,
                        ),),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Lost in Chemistry Lab under Table',
                          style: TextStyle(
                            fontSize: 15,
                            color: txtColor,
                            fontFamily: fontFamily,
                          ),),
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Loreum Ipsum',
                          style: TextStyle(
                            fontSize: 15,
                            color: txtColor,
                            fontFamily: fontFamily,
                          ),),
                      ),
                      SizedBox(height: 40,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Informed By',
                          style: TextStyle(
                            fontSize: 16,
                            color: txtColor,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w700,
                          ),),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('+91XXXXXXXXXX',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0x8AFFFFFF),
                                fontFamily: fontFamily,
                              ),),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              height: 25,
                              width: 45,
                              child: Center(
                                child: Text('Call',
                                style: TextStyle(
                                  color: txtColor,
                                  fontSize: 16,
                                  fontFamily: fontFamily,
                                ),),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0x2EFFFFFF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 40,
                          child: Center(
                            child: Text('CLAIM',
                              style: TextStyle(
                                fontSize: 24,
                                color: txtColor,
                                fontFamily: fontFamily,
                              ),),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              ),
          ),
        ],
        ),);
  }
}