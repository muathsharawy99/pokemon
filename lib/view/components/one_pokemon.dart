import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/Model/pokemon_model.dart';
import 'package:pokemon/view/screens/details_sceen.dart';

class OnePokemon extends StatelessWidget {
  OnePokemon({
    required this.index,
    Key? key,
    required this.pokemonModel,
  }) : super(key: key);
  int index;
  PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                pokemonModel: pokemonModel,
                index: index,
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
                color: Colors.grey, offset: Offset(0, 2), blurRadius: 2.r),
          ],
          border: Border.all(
              width: 1.w,
              color: Colors.grey,
              strokeAlign: BorderSide.strokeAlignOutside),
        ),
        child: Column(
          children: [
            Hero(tag: "${pokemonModel.pokemon?[index].id}",
              child: Image.network(
                  "${pokemonModel.pokemon?[index].img ?? "https://www.shutterstock.com/image-vector/hi-sticker-social-media-content-260nw-1138004576.jpg"}"),
            ),
            Text("${pokemonModel.pokemon?[index].name}")
          ],
        ),
      ),
    );
  }
}
