part of 'character_cubit.dart';

@immutable
abstract class CharacterState {
  const CharacterState();
}

class CharacterInitial extends CharacterState {
  const CharacterInitial();
}

class CharacterLoading extends CharacterState {
  const CharacterLoading();
}

class CharacterLoaded extends CharacterState {
  const CharacterLoaded(this.character, this.characterPage);
  final List<CharacterModel> character;
  final Info characterPage;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CharacterLoaded && other.character == character;
  }

  @override
  int get hashCode => character.hashCode;
}

class CharacterError extends CharacterState {
  const CharacterError(this.message);
  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterError && message == other.message;

  @override
  int get hashCode => message.hashCode;
}
