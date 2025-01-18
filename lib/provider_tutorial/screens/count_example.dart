import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_perference/provider_tutorial/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counterProvider = Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 1), (timer){
      counterProvider.setcount();
    });
  }
  @override
  Widget build(BuildContext context) {
    print("Build");
    final counterProvider = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Provider Tutorials"),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context,value,child){
          print('Only this widget build');
          return Text(
            counterProvider.count.toString(),
            style: TextStyle(fontSize: 40),
          );
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.setcount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

