import 'package:flutter/material.dart';
import '../models/location_model.dart';
import 'index.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo({
    Key? key,
    required this.location,
  }) : super(key: key);
  final List<LocationModel> location;

  @override
  Widget build(BuildContext context) {
    return locationsCard(context, location);
  }

  Widget locationsCard(context, data) {
    return Scaffold(
        backgroundColor: const Color(0xFF24282f),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              // childAspectRatio: 5 / 3,
              // mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
            children: <Widget>[
              for (var i = 0; i < data.length; i++)
                infolocation(context, i, data)
            ]));
  }
}

Widget infolocation(context, index, data) {
  List<LocationModel> location = data;
  return Center(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 2 / 3 * MediaQuery.of(context).size.height,
        minWidth: 2 / 3 * MediaQuery.of(context).size.width,
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
                      location[index].name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    ListTileWidget(
                        title: 'Type',
                        subtitle: location[index].type,
                        paddingI: 4),
                    ListTileWidget(
                        title: 'Dimension',
                        subtitle: location[index].dimension),
                  ]))),
    ),
  );
}
