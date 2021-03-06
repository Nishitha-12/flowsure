import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 30),
      height: 57.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 132, 182, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.question_answer,
              size: 35.0,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/posts');
            },
          ),
          IconButton(
              icon: Icon(
                Icons.event_note,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              }),
          IconButton(
              icon: Icon(
                Icons.fastfood,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/health');
              }),
          IconButton(
              icon: Icon(
                Icons.person,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/user');
              }),
          IconButton(
              icon: Icon(
                Icons.filter_vintage,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/exercise_section');
              }),
        ],
      ),
    );
  }
}
