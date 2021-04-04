import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/container.listTile.dart';
import 'package:my_first_app/widgets/drawer.header.dart';
import 'package:my_first_app/widgets/home.listTile.dart';
import 'package:my_first_app/widgets/image.listTile.dart';
import 'package:my_first_app/widgets/users.listTile.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          MyDrawerHeaderWidget(),
          MyHomeListTile(),
          Divider( color: Colors.blueAccent),
          MyContainerListTile(),
          Divider( color: Colors.blueAccent),
          MyUsersListTile(),
          Divider( color: Colors.blueAccent),
          MyImageListTile(),

        ],
      ),
    );
  }
}
