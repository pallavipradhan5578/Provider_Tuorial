import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});
  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Tutorila"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(

          children: [ValueListenableBuilder(valueListenable: toggle, builder: (context,value,child){
            return TextFormField(obscureText:toggle.value ,
              decoration: InputDecoration(

                  hintText: "Password",
                  suffixIcon: InkWell(onTap: (){
                    toggle.value =!toggle.value;

                  },
                    child: Icon(toggle.value ?Icons.visibility_off:(Icons.visibility)),
                  ) ),
            );
          }),

            Center(
                child: ValueListenableBuilder(
                    valueListenable: counter,
                    builder: (context, value, child) {
                      return Center(child: Text(counter.value.toString()));
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
          print(counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
