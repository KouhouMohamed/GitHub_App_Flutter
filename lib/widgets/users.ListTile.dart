import 'package:flutter/material.dart';
import 'package:my_first_app/pages/users.page.dart';

class MyUsersListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_box_outlined),
      trailing: Icon(Icons.arrow_right),
      title: Text('GitHub Users',
        style: TextStyle(
            fontSize: 30,
            color: Colors.deepPurple
        ),
      ),
      onTap: (){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersPage()));
      },
    );
  }
}
