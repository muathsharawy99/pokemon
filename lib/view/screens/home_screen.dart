import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/view/components/one_pokemon.dart';
import 'package:pokemon/view_model/pokemon_cubit/pokemon_cubit.dart';
import 'package:pokemon/view_model/pokemon_cubit/pokemon_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonCubit, PokemonState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PokemonCubit.get(context);
        if (state is GetPokemonLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 60.h,
            title: Text(
              "Poke App",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(10.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GridView.count(
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 1.w,
                    children: List<Widget>.generate(
                      cubit.pokemonModel.pokemon?.length ?? 10,
                      (index) => OnePokemon(
                          index: index, pokemonModel: cubit.pokemonModel),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
