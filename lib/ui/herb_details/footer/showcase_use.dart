import 'package:flutter/material.dart';

import 'package:herbs/model/herb.dart';

class UseShowcase extends StatelessWidget {
  final Herb herb;

  UseShowcase(this.herb);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          herb.use,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.subtitle,
        ),
      ),
    );
  }
}