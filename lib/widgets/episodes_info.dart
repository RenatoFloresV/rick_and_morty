import 'package:flutter/material.dart';
import '../models/index.dart';
import 'index.dart';

class EpisodesInfo extends StatelessWidget {
  const EpisodesInfo({
    Key? key,
    required this.episodes,
  }) : super(key: key);
  final List<EpisodesModel> episodes;

  @override
  Widget build(BuildContext context) {
    return episodesAll(context, episodes);
  }

  Widget episodesAll(context, data) {
    return Scaffold(
        backgroundColor: const Color(0xFF24282f),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 580,
              childAspectRatio: 5 / 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
            children: <Widget>[
              for (var i = 0; i < data.length; i++)
                infoEpisodes(context, i, data)
            ]));
  }
}

Widget infoEpisodes(context, index, data) {
  List<EpisodesModel> episodes = data;
  return Center(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 2 / 3 * MediaQuery.of(context).size.height,
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: const Color(0xFF3c3e44),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episodes[index].name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    ListTileWidget(
                        title: 'Type',
                        subtitle: episodes[index].episode,
                        paddingI: 4),
                    ListTileWidget(
                        title: 'Air Date', subtitle: episodes[index].airDate),
                  ]))),
    ),
  );
}
