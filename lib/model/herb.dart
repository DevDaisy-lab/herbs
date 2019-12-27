import 'package:meta/meta.dart';


class Herb{
  final int id;
  final String name;
  final String description;
  final String harvesting;
  final String use;
  final String imageUrl;

  Herb({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.harvesting,
    @required this.use,
    @required this.imageUrl,

});

  @override
  String toString(){
    return "Herb $id is named $name";
  }

}