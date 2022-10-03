// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:learning_app/data/model/characters.dart';
import 'package:learning_app/data/repo/characters_repo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<Character> getAllCharacters(){
    charactersRepo.getAllCharacters().then((characters) => {
      emit(CharactersLoaded(characters)),
      this.characters = characters
    });
    return characters;
  }

}
