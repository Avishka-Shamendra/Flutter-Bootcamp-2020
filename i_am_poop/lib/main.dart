import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'I AM POOP',
          style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[500],
      ),
      backgroundColor: Colors.brown[100],
      body: Center(
        child: Image(
          image: AssetImage('images/poop.png'),
        ),
      ),
    ),
  ));
}
