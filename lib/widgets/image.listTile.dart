import 'package:flutter/material.dart';
import 'package:my_first_app/pages/image.page.dart';

class MyImageListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.add_photo_alternate_outlined),
      trailing: Icon(Icons.arrow_right),
      title: Text('Images',
        style: TextStyle(
            fontSize: 30,
            color: Colors.deepPurple
        ),
      ),
      onTap: (){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagePage()));
      },
    );
  }
}
