import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:libroflutter/provider/models.dart';

class AnimeRecurso extends ChangeNotifier {
List<Datum> animelist = [];
 AnimeRecurso(){
   getDistritoprovider();
 }
 getDistritoprovider()async {
  var uri = 'https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=7/anime?filter[attributes]=adventure';
  var url = Uri.parse(uri);
  final response = await http.get(url);
  final decodeData =  AnimeApi.fromJson(response.body);
  animelist = decodeData.data;
  notifyListeners();
 }
}

 