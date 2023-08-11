import 'package:bhcare/Widgets/MyAnimatedWidget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'Model/Product.dart';
import 'Widgets/ProductBox.dart';
import 'bhc/my_widget.dart';
import 'messagechanel/my_browser_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BHCARE',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black45),
        useMaterial3: true,
      ),
      home:  SafeArea(child: MyWidget()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late var controller;


 @override
  void initState() {
   controller=  AnimationController(duration: const Duration(seconds: 2), vsync:this);
   animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
   controller.forward();
    super.initState();
  }
  _openBrowser() async {
    showToast();
    MyBrowserPlugin().openBrowser("https://flutter.dev");


  }

  void showToast() {
    Fluttertoast.showToast(
      msg: 'This is a toast message!',
      toastLength: Toast.LENGTH_SHORT, // Duration for which the toast is visible
      gravity: ToastGravity.CENTER, // Position of the toast on the screen
      backgroundColor: Colors.black, // Background color of the toast
      textColor: Colors.white, // Text color of the toast
      fontSize: 16.0, // Font size for the toast message
    );
  }

  @override
  Widget build(BuildContext context) {

    var items = Product.getProducts();
    return  Scaffold(
        appBar: AppBar(title: Text("Product Navigation")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(child:

            MyAnimatedWidget(child: ProductBox(item: items[index]),animation: animation,),
            onTap: ()=>{

              showToast
    /*Navigator.push(context,

                  MaterialPageRoute( builder: (context) => ProductPage(item:
                  items[index]),) )*/



            },);
          },

        ));

  }
}
