import 'package:dekornata/product.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ProductPageScreen(),
    );
  }

  Widget textNumber() {
    //var arr = ['a', 'b', 'c', 'd', 'e'];
    return Text(createPhoneNumber([3, 2, 3, 4, 11, 6, 7, 8, 9, 0]));
  }

  String createPhoneNumber(List arr) {
    String result = "";
    bool errorInput = false;
    arr.forEach((element) {
      if (!(element >= 0 && element <= 9)) {
        errorInput = true;
        print("true");
      }
    });
    if (arr.length == 10 && !errorInput) {
      result = "(${arr[0]}${arr[1]}${arr[2]}) ${arr[3]}${arr[4]}${arr[5]}-${arr[6]}${arr[7]}${arr[8]}${arr[9]}";
    } else {
      result = "invalid";
    }
    return result;
  }
}
