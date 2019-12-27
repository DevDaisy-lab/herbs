import 'package:flutter/material.dart';

import 'package:herbs/model/herb.dart';

class HarvestingShowcase extends StatelessWidget {
  final Herb herb;

  HarvestingShowcase(this.herb);

  @override
  Widget build(BuildContext context) {


    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          herb.harvesting,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.subtitle),
      ),
    );
  }
}
