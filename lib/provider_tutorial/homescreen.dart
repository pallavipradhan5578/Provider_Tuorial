import 'package:flutter/material.dart';

class Stateless_widget_Screen extends StatelessWidget {
   Stateless_widget_Screen({super.key});
   int x = 10;
  @override
  Widget build(BuildContext context) {
    // int x=0;
    print("build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("PROVIDER TUTORIALS"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text(
                x.toString(),
                style: TextStyle(fontSize: 50),
              ),
            ),
          )
        ],
      ),floatingActionButton: FloatingActionButton(onPressed: (){
        x++;
        print(x);
    },child: Icon(Icons.add),),
    );
  }
}
