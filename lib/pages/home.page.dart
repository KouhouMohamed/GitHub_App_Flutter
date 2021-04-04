import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/drawer.widget.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer pour creer le menu
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child:
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
               // image: AssetImage("images/ENSET.jpg")
                image: NetworkImage("https://pixabay.com/get/g7f447cc61bdd7248e7e0980cbca0269c07cb1d2d8c7fb29c04892ca587f17e0eee67724df3b997af8b6199c55c5235540213c36bcac3ccfe535b71ea0be2b1f4_1280.jpg")
              )
            ),
          )

      ),
        /*floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                //Code de la fct
              },
            ),
            //Pour separer entre les buttons
            SizedBox(height: 6),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: (){
                //Code de la fct
              },
            ),
          ],
        )*/
    );
  }
}
