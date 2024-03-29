import 'package:bhcare/Model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'RatingBox.dart';

class ProductPage extends StatelessWidget {


   ProductPage({super.key, this.item});
  var item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: ScopedModel<Product>(
            model: this.item,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(this.item.image),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(this.item.name,
                                  style: TextStyle(fontWeight:
                                  FontWeight.bold)),
                              Text(this.item.description),
                              Text("Price: " +
                                  this.item.price.toString()),
                              ScopedModelDescendant<Product>(builder: (BuildContext context, Widget? child, Model model) {
                                return RatingBox(item: item);
                              })
                            ],
                          )))
                ]),
          ),
        ),
      ),
    );

  }
}
