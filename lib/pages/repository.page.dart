import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ReposPage extends StatefulWidget {
  String username;
  String imageUrl;
  ReposPage({this.username,this.imageUrl});

  @override
  _ReposPageState createState() => _ReposPageState();
}

class _ReposPageState extends State<ReposPage> {
  dynamic dataRepo;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRepos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Repositories Page : ${widget.username}"),
            CircleAvatar(
              backgroundImage: NetworkImage("${widget.imageUrl}")
            )
          ],
        )
      ),
      body: ListView.separated(
          itemCount: dataRepo==null?0:dataRepo.length,
            separatorBuilder: (context,index)=>Divider(height: 2,color: Colors.blueAccent,),
            itemBuilder: (context,index)=>ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${dataRepo[index]['name']}"),
                        Text("language : ${dataRepo[index]['language']}"),

                      ]),
                  Text((dataRepo[index]['private'])?"private":"public",
                  style: TextStyle(
                    color: Colors.red
                  )),

                ],
              )
            ),

        )

    );
  }

  void loadRepos() async{
   String url = "https://api.github.com/users/${widget.username}/repos";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode ==200){
      //if successed
      setState(() {
        dataRepo=json.decode(response.body);
      });
    }

  }
}
