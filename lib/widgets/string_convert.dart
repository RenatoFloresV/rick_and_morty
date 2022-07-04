import 'package:flutter/material.dart';

class StringConvert extends StatelessWidget {
  StringConvert({Key? key}) : super(key: key);
  final List<String> list = [
    "https://rickandmortyapi.com/api/character/1",
    "https://rickandmortyapi.com/api/character/2",
    "https://rickandmortyapi.com/api/character/35",
    "https://rickandmortyapi.com/api/character/38",
    "https://rickandmortyapi.com/api/character/62",
    "https://rickandmortyapi.com/api/character/92",
    "https://rickandmortyapi.com/api/character/127",
    "https://rickandmortyapi.com/api/character/144",
    "https://rickandmortyapi.com/api/character/158",
    "https://rickandmortyapi.com/api/character/175",
    "https://rickandmortyapi.com/api/character/179",
    "https://rickandmortyapi.com/api/character/181",
    "https://rickandmortyapi.com/api/character/239",
    "https://rickandmortyapi.com/api/character/249",
    "https://rickandmortyapi.com/api/character/271",
    "https://rickandmortyapi.com/api/character/338",
    "https://rickandmortyapi.com/api/character/394",
    "https://rickandmortyapi.com/api/character/395",
    "https://rickandmortyapi.com/api/character/435"
  ];
  final String url = "https://rickandmortyapi.com/api/character/";
  @override
  Widget build(BuildContext context) {
    // final owo =list.remove(url);
    return Material(
        child: ListView(
      children: list.map((e) {
        return ListTile(title: Text(e.replaceAll(url, "")));
      }).toList(),
    ));

    
  }
strinId(list) {
    return list.map((e) {
      return e.replaceAll(url, "");
    }).toList();
  }

}
