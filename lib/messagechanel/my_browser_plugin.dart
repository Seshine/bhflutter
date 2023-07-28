import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyBrowserPlugin {



  static const MethodChannel _channel = const MethodChannel('my_browser');
  static Future<String> get platformVersion async {
    final String version = await
    _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  Future<void> openBrowser(String urlString) async {
    try {
      final int result = await _channel.invokeMethod('openBrowser',
          <String, String>{
            'url': urlString
          });
    } on PlatformException catch (e) {
      // Unable to open the browser
      print(e);
    }
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


}