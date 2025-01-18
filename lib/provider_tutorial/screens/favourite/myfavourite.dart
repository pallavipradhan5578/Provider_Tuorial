import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_perference/provider_tutorial/provider/favourite_provider.dart';
class MyFavouriteItemsScreen extends StatefulWidget {
  const MyFavouriteItemsScreen({super.key});

  @override
  State<MyFavouriteItemsScreen> createState() => _MyFavouriteItemsScreenState();
}

class _MyFavouriteItemsScreenState extends State<MyFavouriteItemsScreen> {
  @override
  Widget build(BuildContext context) {
     final favouriteProvider=Provider.of<FavouriteItemProvider>(context);
    print("Build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Favourite App'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFavouriteItemsScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: favouriteProvider.selectedItems.length,
                  itemBuilder: (context, index) {
                    return Consumer<FavouriteItemProvider>(
                        builder: (context, value, child) {
                          return ListTile(
                            onTap: () {
                              if (value.selectedItems.contains(index)) {
                                value.removeItems(index);
                              } else {
                                value.addItems(index);
                              }
                            },
                            title: Text("items" + index.toString()),
                            trailing: Icon(value.selectedItems.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
