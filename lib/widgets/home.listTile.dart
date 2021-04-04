import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';
import 'package:my_first_app/pages/home.page.dart';

class MyHomeListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(Icons.home),
      trailing: Icon(Icons.arrow_right),
      title: Text('Home',
        style: TextStyle(
            fontSize: 30,
            color: Colors.deepPurple
        ),
      ),
      onTap: (){
        Navigator.pop(context);
        //Navigator.pushNamed(context, "/home")  ;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
      },
    );
  }
}
