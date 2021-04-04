import 'package:flutter/material.dart';
import 'package:my_first_app/pages/home.page.dart';
import 'package:my_first_app/widgets/drawer.header.dart';
import 'package:my_first_app/widgets/drawer.widget.dart';

void main(){

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home":(context)=>HomePage(),
        "/container":(context)=>HomePage(),
        "/quiz":(context)=>HomePage(),
      },
      title: "First App",
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 18,
            color: Colors.black,
          )
        ),
      ),
      home:HomePage()
      );
  }
}
