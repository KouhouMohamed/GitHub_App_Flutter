import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  String inputQuery="";
  dynamic data;
  List<dynamic> items=[];
  int currentPage=0;
  int totalPage;
  int perPage=20;
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: Text("Search Images of : $inputQuery")
      ),
      body: Center(
        child:Column(
          children: [
            Row(
              children: [
                //to say that this child.wight = page.wight
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        onChanged: (value){
                          this.inputQuery=value;
                        },
                        controller: textEditingController,
                        decoration: InputDecoration(
                          //icon showen in the left of textField
                            icon: Icon(Icons.image),
                            //space between text and border
                            contentPadding:EdgeInsets.only(left: 20),
                            //border of text field
                            border: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(10) ,
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,width: 1,
                                )
                            )
                        ),
                      )
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.image_search_rounded
                      , color: Colors.indigoAccent,),
                    onPressed: (){
                      //get the input from text field
                      setState(() {
                        currentPage=0;
                        items=[];
                        this.inputQuery = textEditingController.text;
                        _search(this.inputQuery);
                      });
                    })
              ],),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index){
                      return ListTile(
                        title: Column(
                          children: [
                             Container(

                                      child:Card(
                                        child: Image.network("${items[index]['largeImageURL']}"),
                                       ),
                               width: double.infinity,
                              ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    color: Colors.red,

                                    child: Text("${items[index]['tags']}",
                                    style: TextStyle(
                                      fontSize: 26,

                                    ),),

                            ),

                        ]),
                      );
                  },
              ),
            )
          ],
        ) ,
      ),
    );
  }

  void _search(String inputQuery) {
      String url = "https://pixabay.com/api/?key=21005223-56d3c8bcb1860eb0a063b885f&q=$inputQuery";
      http.get(Uri.parse(url))
        .then((response){
        setState(() {
          print("$url");
          this.data=json.decode(response.body);
          this.items.addAll(data['hits']);
          print("${items[0]['largeImageURL']}");
          if(this.data['totalHits']%this.perPage == 0){
            this.totalPage = this.data['totalHits']~/this.perPage;
          }
          else {
            this.totalPage =(this.data['totalHits'] ~/ this.perPage).floor() + 1;
          }
        });
      })
        .catchError((err){
          items=[];
          print("Error");
      });
  }
}
