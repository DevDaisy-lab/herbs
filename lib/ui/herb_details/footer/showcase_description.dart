import 'package:flutter/material.dart';

import 'package:herbs/model/herb.dart';

class DescriptionShowcase extends StatelessWidget {
  final Herb herb;

  DescriptionShowcase(this.herb);

  @override
  Widget build(BuildContext context) {

    return new Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: new Text(
          herb.description,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.subtitle,
        ),
      ),
    );
  }
}