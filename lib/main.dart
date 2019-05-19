import 'package:flutter/material.dart';
import 'home.dart';
void main(){
  runApp(
    MaterialApp(
      title:"Click To Chat",
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primaryColor: Color(0xFF44bd32),
        accentColor: Color(0xFF487eb0)
      ),
    )
  );
}