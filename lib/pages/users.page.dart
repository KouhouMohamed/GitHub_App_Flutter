import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart"  as http;
import 'package:my_first_app/pages/repository.page.dart';
class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String inputQuery="";
  bool notVisible=false;
  TextEditingController textEditingController = new TextEditingController();
  dynamic data;
  int currentPage=0;
  int totalPage=0;
  int pageSize=20;
  ScrollController scrollController = ScrollController();
  List<dynamic> items = [];
  //this function is Auto running when we create an instance of a class
  //and before built() function
  //it exicute one time
 @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        setState(() {
          if(currentPage < totalPage-1){
            ++currentPage;
            _search(inputQuery);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text("Users Page : $inputQuery(page:${(currentPage+1)}/$totalPage)")
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

                        //for hidden text if true
                        obscureText: notVisible,
                        onChanged: (value){
                          //If text field input change
                          this.inputQuery=value;
                        },
                        controller: textEditingController,
                        decoration: InputDecoration(
                          //icon showen in the left of textField
                            icon: Icon(Icons.logout),
                            //icon showen in the text Field in the right
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  notVisible = !notVisible;
                                });
                              },
                              icon :Icon(
                                notVisible==true?Icons.visibility_off:Icons.visibility
                              ),
                            ),
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
                    icon: Icon(Icons.search
                      , color: Colors.indigoAccent,),
                    onPressed: (){
                      //get the input from text field
                      setState(() {
                        currentPage=0;
                        items=[];
                        this.inputQuery = textEditingController.text;
                        _search(inputQuery);
                      });
                    })
              ],
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context,index)=>Divider(height: 2,color: Colors.blueGrey,),
                controller: scrollController,
                //ListView.builderis like a loop : itemCout = nbt max of iterations, itemBuilder=what to do to each item
                  itemCount: items.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>ReposPage(
                                username: items[index]['login'],
                                imageUrl: items[index]['avatar_url'])
                        )
                        );
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage("${items[index]['avatar_url']}"),
                                radius: 30,
                              ),
                              SizedBox(width: 6,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${items[index]['login']}" ),
                                  Text("Id : ${items[index]['id']}"),
                                ])
                            ]),
                          CircleAvatar(
                            child: Text("${items[index]['score']}"),
                          ),
                        ],
                      )

                    );
                  }
              ),
            )
          ],
        ) ,
      ),
    );
  }

  void _search(String inputQuery) {
    String url = "https://api.github.com/search/users?q=$inputQuery&per_page=$pageSize&page=$currentPage";
    http.get(Uri.parse(url))
        .then((response){
          setState(() {
            this.data=json.decode(response.body);
            this.items.addAll(data['items']);
            if(this.data['total_count']%this.pageSize == 0){
              this.totalPage = this.data['total_count']~/this.pageSize;
            }
            else {
              this.totalPage =
                  (this.data['total_count'] ~/ this.pageSize).floor() + 1;
            }
          });

    })
        .catchError((err){
        print(err);
    });
  }

}
