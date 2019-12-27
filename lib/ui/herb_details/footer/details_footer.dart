import 'package:flutter/material.dart';

import 'package:herbs/model/herb.dart';
import 'package:herbs/ui/herb_details/footer/showcase_description.dart';
import 'package:herbs/ui/herb_details/footer/showcase_harvesting.dart';
import 'package:herbs/ui/herb_details/footer/showcase_use.dart';

class HerbShowcase extends StatefulWidget {
  final Herb herb;

  HerbShowcase(this.herb);

  @override
  _HerbShowcaseState createState() => _HerbShowcaseState();
}

class _HerbShowcaseState extends State<HerbShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(text: 'Description'),
      Tab(text: 'Harvesting'),
      Tab(text: 'Use'),
    ];
    _pages = [
      DescriptionShowcase(widget.herb),
      HarvestingShowcase(widget.herb),
      UseShowcase(widget.herb),
    ];
    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TabBar(
            labelStyle: Theme.of(context).textTheme.title,
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
