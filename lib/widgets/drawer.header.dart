import 'package:flutter/material.dart';

class MyDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.lightBlueAccent,
                  Colors.lightBlue,
                ]
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/profil.png"),
              radius: 50,
            ),
            SizedBox(width: 6,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("KOUHOU MOHAMED",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.red
                  ),
                ),
                SizedBox(height: 6,),
                Text("ENSET MOHAMMEDIA"),
                SizedBox(height: 6,),
                Text("medko24@gmail.com")
              ],
            )
          ],
        )
    );
  }
}
