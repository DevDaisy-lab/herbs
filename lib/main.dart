import 'package:flutter/material.dart';
import 'package:herbs/ui/herb_list.dart';
void main() => runApp(HerbBoxApp());

class HerbBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.yellow[200],
          brightness: Brightness.light,
          textTheme: ThemeData.light().textTheme.copyWith(
            headline: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 26.0,
            ),
            title: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 19.0,
            ),
            subtitle: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              letterSpacing: 1,
            ),
          ),

      ),
      home: HerbList(),
    );
  }
}

