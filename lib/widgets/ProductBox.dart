import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../MessageChanel/my_browser_plugin.dart';
import '../Model/Product.dart';
import 'RatingBox.dart';

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}) : super(key: key);
  final Product item;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: MediaQuery.of(context).size.width * 0.5,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(child: Image.network(this.item.image),width: 100,),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: ScopedModel<Product>(
                            model: this.item,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(this.item.name,
                                    style:
                                    TextStyle(fontWeight:
                                    FontWeight.bold)),
                                Text(this.item.description),
                                Text("Price: " +
                                    this.item.price.toString()),
                                ElevatedButton(
                                  onPressed: ()=> MyBrowserPlugin().openBrowser("https://flutter.dev"),
                                  child: Text('Show Toast Message'),
                                ),
                                ScopedModelDescendant<Product>(
                                    builder: (context, child, item) {
                                      return RatingBox(item: item);
                                    })
                              ],
                            ))))
              ]),
        ));
  }

}
