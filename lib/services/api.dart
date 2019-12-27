import 'dart:convert';
import 'package:herbs/model/herb.dart';

class HerbApi{
  static List<Herb>allHerbsFromJson(String jsonData){
    List<Herb> herbs = [];
    json.decode(jsonData)['herbs'].forEach((herb) => herbs.add(_forMap(herb)));
    return herbs;
  }
  static Herb _forMap(Map<String, dynamic>map){
    return new Herb(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        harvesting: map['harvesting'],
        use: map['use'],
        imageUrl: map['image_url']
    );
  }
}