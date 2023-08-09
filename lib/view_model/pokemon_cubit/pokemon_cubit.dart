import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/Model/pokemon_model.dart';
import 'package:pokemon/view_model/dio_helper/dio_helper.dart';
import 'package:pokemon/view_model/dio_helper/endPoints.dart';
import 'package:pokemon/view_model/pokemon_cubit/pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(InitState());

  static PokemonCubit get(context) => BlocProvider.of<PokemonCubit>(context);
  var pokemonModel = PokemonModel();

  void getPokemon() {
    emit(GetPokemonLoading());
    DioHelper.get(endPoint: baseUrlWithEndPoint).then((value) {
      final response = jsonDecode(value.data);
      pokemonModel = PokemonModel.fromJson(response);
      print(pokemonModel);
      emit(GetPokemonSuccess());
    }).catchError((error) {
      print(error);
      emit(GetPokemonError());
    });
  }
}
