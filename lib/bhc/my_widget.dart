import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(

                child: DefaultTextStyle(style: TextStyle(fontSize: 30,color: Colors.white),
                child: Text("LOGIN")), // Replace with your image asset
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: SvgPicture.asset('assets/logo.svg'), // Replace with your image asset
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Center(
            child: Column(
              children: [
                SizedBox(height: 60.0),
                SvgPicture.asset('assets/login_icon.svg'), // Replace with your image asset
                SizedBox(height: 30.0),
            Material(

                  child: Container(
                    color: Colors.black,
                    height: 50,
                    child: TextField(
                      style: TextStyle(color: Colors.white),

                      decoration: InputDecoration(

                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), // White border under text
                          ), // No visible border
                        hintText: 'Username/Login*',
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.black, // Optional: Background color
                        filled: true

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
            Material(
                  child: Container(
                    color: Colors.black,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(

                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), // White border under text
                          ), // No visible border
                          hintText: 'password*',
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.black, // Optional: Background color
                          filled: true

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                 
                      child: ElevatedButton(

                        onPressed: () {
                          // Button 1 pressed action
                        },
                        child: Text('Button 1'),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Button 2 pressed action
                      },
                      child: Text('Button 2'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}