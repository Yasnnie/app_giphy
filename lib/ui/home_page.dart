import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _tfieldSearch = TextEditingController();

  String _search = "";
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search.isEmpty) {
      response = await http.get(Uri.parse(
          "https://api.giphy.com/v1/gifs/trending?api_key=4vZ7bQQtztRUUXAS2UsVHEqxtVQXbUwI&limit=20&rating=g"));
    } else {
      response = await http.get(Uri.parse(
          "https://api.giphy.com/v1/gifs/search?api_key=4vZ7bQQtztRUUXAS2UsVHEqxtVQXbUwI&q=$_search&limit=20&offset=$_offset&rating=g&lang=pt"));
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.gif"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
            decoration: InputDecoration(
              labelText: "Pesquise aqui.",
              labelStyle: TextStyle(
                color: Colors.black87),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search,color: Colors.black87,),
            ),
            style: TextStyle(color: Colors.black, fontSize: 18),
            controller: _tfieldSearch,
            )
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
                          strokeWidth: 5,
                        ),
                      );
                     default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        return _createGifTable(context,snapshot);
                    }
                  }
              
              )
            )
        ],
      ),
    );
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot){
      return Container();
  }
}
