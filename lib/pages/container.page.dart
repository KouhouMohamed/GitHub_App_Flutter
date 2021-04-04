import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Container",
          ),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "My counter equal to $counter",
                  style: TextStyle(fontSize: 30, color: Colors.indigoAccent),
                ),
                SizedBox(
                  height: 50,
                ),
                IconButton(
                    icon: Icon(
                        Icons.add_circle,
                      color: Colors.green,
                      size: 50,
                    ),
                    onPressed: (){
                  setState(() {
                    ++counter;
                  });
                    })
              ],
            )
        )
    );
  }
}
