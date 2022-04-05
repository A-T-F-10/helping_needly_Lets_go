import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/models/info/images_list.dart';
import 'package:helpings_needlys/models/info/info.dart';
import 'package:helpings_needlys/pages/pleases/info_please.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var i in search[0]) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, itme) {
        return Card(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! / 25,
              vertical: SizeConfig.screenHeight! / 100),
          elevation: 10,
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (__) => InofPlease(
                        search,
                        itme,
                        imageListb: images,
                      )));
            },
            title: Text(matchQuery[itme]),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];
    for (var i in search[0]) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, itme) {
        return Card(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! / 25,
              vertical: SizeConfig.screenHeight! / 100),
          elevation: 10,
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (__) => InofPlease(
                        search,
                        itme,
                        imageListb: images,
                      )));
            },
            title: Text(matchQuery[itme]),
          ),
        );
      },
    );
  }
}
