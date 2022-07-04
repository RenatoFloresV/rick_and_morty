import 'package:http/http.dart' as http;

const url = 'https://rickandmortyapi.com/api';

class Services {
  //GET CHARACTER

  Future<String> getCharacter() async {
    final response = await http.get(Uri.parse('$url/character'));
    return response.body;
  }

  //GET LOCATIONS

  Future<String> getLocation() async {
    final response = await http.get(Uri.parse('$url/location'));
    return response.body;
  }

  //GET EPISODES

  Future<String> getEpisodes() async {
    final response = await http.get(Uri.parse('$url/episode'));
    return response.body;
  }
}
