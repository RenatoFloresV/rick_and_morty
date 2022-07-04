import 'package:rick_and_morty/services/index.dart';
import 'package:rick_and_morty/services/repositories.dart';

final Services apiProvider = Services();

final CharacterRepository characterRepository = CharacterRepository(apiProvider: apiProvider);

final LocationsRepository locationsRepository = LocationsRepository(apiProvider: apiProvider);

final EpisodesRepository episodesRepository = EpisodesRepository(apiProvider: apiProvider);
