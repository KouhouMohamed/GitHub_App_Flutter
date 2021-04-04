import 'package:flutter/material.dart';
import 'package:my_first_app/pages/container.page.dart';

class MyContainerListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.ad_units_outlined),
      trailing: Icon(Icons.arrow_right),
      title: Text('Counter',
        style: TextStyle(
            fontSize: 30,
            color: Colors.deepPurple
        ),
      ),
      onTap: (){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ContainerPage()));
      },
    );
  }
}
