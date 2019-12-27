import 'dart:async';

import 'package:flutter/material.dart';

import 'package:herbs/model/herb.dart';
import 'package:herbs/services/api.dart';
import 'package:herbs/utils/routes.dart';
import 'package:herbs/ui/herb_details/details_page.dart';

class HerbList extends StatefulWidget {
  @override
  _HerbListState createState() => _HerbListState();
}

class _HerbListState extends State<HerbList> {
  List<Herb> _herbs = [];

  @override
  void initState() {
    super.initState();
    _loadHerbs();
  }

  _loadHerbs() async {
    String fileData =
        await DefaultAssetBundle.of(context).loadString("assets/herbs.json");
    setState(() {
      _herbs = HerbApi.allHerbsFromJson(fileData);
    });
  }

  Widget _buildHerbItem(BuildContext context, int index) {
    Herb herb = _herbs[index];

    return Container(
    margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
            elevation: 5,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Flexible(
                      child: FlatButton(
                        onPressed: () => _navigateToHerbDetails(herb, index),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 8, right: 5, bottom: 8),
                          child: new Hero(
                            tag: index,
                            child: new CircleAvatar(
                              backgroundImage: new NetworkImage(herb.imageUrl),
                              radius: 65.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  herb.name,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _navigateToHerbDetails(Herb herb, Object avatarTag) {
    Navigator.of(context).push(
      new FadePageRoute(
        builder: (h) {
          return HerbDetailsPage(herb, avatarTag: avatarTag);
        },
        settings: new RouteSettings(),
      ),
    );
  }

  Widget _getAppTitleWidget() {
    return Text(
      'Herbs',
      style: Theme.of(context).textTheme.headline,
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.fromLTRB(5.0, 45.0, 8.0, 0.0),
      child: Column(
        children: <Widget>[
          _getAppTitleWidget(),
          _getListViewWidget(),
        ],
      ),
    );
  }

  Future<Null> refresh() {
    _loadHerbs();
    return Future<Null>.value();
  }

  Widget _getListViewWidget() {
    return Flexible(
      child: RefreshIndicator(
        onRefresh: refresh,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: _herbs.length,
          itemBuilder: _buildHerbItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: _buildBody(),
    );
  }
}
