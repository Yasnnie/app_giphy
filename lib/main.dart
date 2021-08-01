import 'package:flutter/material.dart';

import 'ui/home_page.dart';
/*
TRENDING
https://api.giphy.com/v1/gifs/trending?api_key=4vZ7bQQtztRUUXAS2UsVHEqxtVQXbUwI&limit=20&rating=g

SEARCH
https://api.giphy.com/v1/gifs/search?api_key=4vZ7bQQtztRUUXAS2UsVHEqxtVQXbUwI&q=dogs&limit=25&offset=75&rating=g&lang=pt
*/
void main() {
  runApp(MaterialApp(
    home: App(),
    theme: ThemeData(
      hintColor: Colors.black54,
      primaryColor: Colors.black87,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
        hintStyle: TextStyle(color: Colors.black54)
    ),)
    ));
}


