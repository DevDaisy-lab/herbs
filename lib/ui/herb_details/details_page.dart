import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:herbs/model/herb.dart';
import 'package:herbs/ui/herb_details/header/details_header.dart';
import 'package:herbs/ui/herb_details/footer/details_footer.dart';

class HerbDetailsPage extends StatefulWidget {
  final Herb herb;
  final Object avatarTag;

  HerbDetailsPage(
    this.herb, {
    @required this.avatarTag,
  });

  @override
  _HerbDetailsPageState createState() => _HerbDetailsPageState();
}

class _HerbDetailsPageState extends State<HerbDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = BoxDecoration(
      gradient: LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: [
          Colors.green,
          Colors.blue,
        ],
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 23),
          child: Container(
            decoration: linearGradient,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HerbDetailHeader(widget.herb, avatarTag: widget.avatarTag,),
                HerbShowcase(widget.herb),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
