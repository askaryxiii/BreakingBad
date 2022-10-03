// ignore_for_file: body_might_complete_normally_nullable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/business_logic/cubit/characters_cubit.dart';
import 'package:learning_app/constants/strings.dart';
import 'package:learning_app/data/api/characters_api.dart';
import 'package:learning_app/data/model/characters.dart';
import 'package:learning_app/data/repo/characters_repo.dart';
import 'package:learning_app/persentation/screens/Characters_screen.dart';

import 'package:learning_app/persentation/screens/characters_details.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepo = CharactersRepo(CharactersApi());
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Characters_screen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext contxt) => charactersCubit,
                  child: CharactersScreen(),
                ));

      case Characters_details:
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => characters_details(character: character));
    }
  }
}
