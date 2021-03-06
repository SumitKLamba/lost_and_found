import 'package:flutter/material.dart';
import 'package:lost_and_found/onClickCard.dart';
import 'package:url_launcher/url_launcher.dart';

class FoundCard extends StatelessWidget {
  Color txtColor = Colors.white;
  double brdrRadius = 8;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            color: Color(0x00FFFFFF),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  minRadius: 25,
                ),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('+91XXXXXXXXXX',
                      style: TextStyle(
                        color: txtColor,
                      ),),
                    Text('11:24 PM',
                      style: TextStyle(
                        color: txtColor,
                      ),),
                  ],
                ),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: ()=> launch("tel://21213123123"),
                    child: Container(
                      height: 25,
                      width: 45,
                      child: Center(
                        child: Text('Call',
                          style: TextStyle(
                            color: txtColor,
                          ),),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFF57606F),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OnClickCard();
              }));
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 4,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'images/box.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.width / 1.5,
                        color: Color(0x00FFFFFF),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection: TextDirection.ltr,
                          children: <Widget>[
                            Text(
                              'Pencil Box',
                              style: TextStyle(
                                color: txtColor,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Found in Chemistry Lab under Table Loreum Ipsum ',
                              style: TextStyle(
                                color: txtColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(brdrRadius),
                      gradient: LinearGradient(
                          colors: [Color(0xFFF99E4F), Color(0x00F99E4F)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(brdrRadius),
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}