import 'package:rick_and_morty/services/index.dart';

class CharacterRepository {
  Services apiProvider = Services();

  CharacterRepository({required this.apiProvider});

  Future<dynamic> getCharacter() async {
    return await apiProvider.getCharacter();
  }
}

class LocationsRepository {
  Services apiProvider = Services();

  LocationsRepository({required this.apiProvider});

  Future<dynamic> getLocation() async {
    return await apiProvider.getLocation();
  }
}

class EpisodesRepository {
  Services apiProvider = Services();

  EpisodesRepository({required this.apiProvider});

  Future<dynamic> getEpisodes() async {
    return await apiProvider.getEpisodes();
  }
}
