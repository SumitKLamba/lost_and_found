import 'package:flutter/material.dart';
import 'package:lost_and_found/foundCard.dart';

class ListViewFoundCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2D3E50),
      width: MediaQuery.of(context).size.width/1.5,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          FoundCard(),
          FoundCard(),
          FoundCard(),
          FoundCard(),
        ],
      ),
    );
  }
}