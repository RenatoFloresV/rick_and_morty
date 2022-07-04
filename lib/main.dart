import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/characters_screen.dart';
import 'package:rick_and_morty/services/http_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty',
        home: MultiBlocProvider(providers: [
          BlocProvider<CharacterCubit>(
            create: (context) => CharacterCubit(characterRepository),
          ),
          BlocProvider<EpisodesCubit>(
              create: (context) => EpisodesCubit(episodesRepository)),
          BlocProvider<LocationCubit>(
            create: (context) => LocationCubit(locationsRepository),
          )
        ], child: const CharactersScreen()));
  }
}
