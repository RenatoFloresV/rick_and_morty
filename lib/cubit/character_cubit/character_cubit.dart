import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/services/repositories.dart';
import '../../models/character_model.dart';
part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.characterRepository) : super(const CharacterInitial());

  final CharacterRepository characterRepository;

  Future<void> getCharacter() async {
    emit(const CharacterLoading());
    try {
      final characters = await requestCharacterPage();
      final List<CharacterModel> list = characters.results;

      emit(CharacterLoaded(list, characters.info));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }

  Future<Character> requestCharacterPage() async {
    final response = await characterRepository.getCharacter();
    final json = jsonDecode(response);
    final character = Character.fromJson(json);
    return character;
  }
}
