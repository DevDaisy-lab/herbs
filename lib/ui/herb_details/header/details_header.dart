import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:herbs/model/herb.dart';
import 'package:herbs/ui/herb_details/header/cut_colored_image.dart';

class HerbDetailHeader extends StatefulWidget {
  final Herb herb;
  final Object avatarTag;

  HerbDetailHeader(
    this.herb, {
    @required this.avatarTag,
  });

  @override
  _HerbDetailHeaderState createState() => _HerbDetailHeaderState();
}

class _HerbDetailHeaderState extends State<HerbDetailHeader> {
  static const BACKGROUND_IMAGE = 'assets/images/profile_header_background.png';
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    var diagonalBackground = new DiagonallyCutColoredImage(
      new Image.asset(
        BACKGROUND_IMAGE,
        width: screenWidth,
        height: 280.0,
        fit: BoxFit.cover,
      ),
      color: Colors.green[300],
    );

    var avatar = Hero(
      tag: widget.avatarTag,
      child: CircleAvatar(
        backgroundImage: NetworkImage(widget.herb.imageUrl),
        radius: 85.0,
      ),
    );


    return Stack(
      children: [
        diagonalBackground,
        Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.3,
          child: Column(
            children: [
              avatar,
            ],
          ),
        ),
        Positioned(
            top: 26.0,
            left: 4.0,
            child: BackButton(
              color: Colors.white,
            ),),
      ],
    );
  }
}
