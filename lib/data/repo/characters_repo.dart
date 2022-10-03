import 'package:learning_app/data/api/characters_api.dart';
import 'package:learning_app/data/model/characters.dart';

class CharactersRepo {
  final CharactersApi charactersApi;

  CharactersRepo(this.charactersApi);

  Future<List<Character>> getAllCharacters () async {
    final characters = await charactersApi.getCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}