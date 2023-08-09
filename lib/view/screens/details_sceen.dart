import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/Model/pokemon_model.dart';
import 'package:pokemon/view/components/types.dart';
import 'package:pokemon/view/components/weakness.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({required this.pokemonModel, required this.index, Key? key})
      : super(key: key);
  int index;
  PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60.h,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          "${pokemonModel.pokemon?[index].name}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Container(
            height: 400.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topCenter,
              children: [
                PositionedDirectional(
                  top: -75,
                  child: Hero(tag: "${pokemonModel.pokemon?[index].id}" ,
                    child: Image.network(
                      "${pokemonModel.pokemon?[index].img}",
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${pokemonModel.pokemon?[index].name}",
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Height:${pokemonModel.pokemon?[index].height}",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Weight:${pokemonModel.pokemon?[index].weight}",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Types",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35.h,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              width: 50,
                            ),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:
                                pokemonModel.pokemon?[index].type?.length ?? 1,
                            itemBuilder: (context, index) {
                              return Types(
                                  type: pokemonModel
                                      .pokemon?[this.index].type?[index]);
                            },
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Weakness",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SingleChildScrollView(scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35.h,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: 10.w,
                              ),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: pokemonModel
                                      .pokemon?[index].weaknesses?.length ??
                                  1,
                              itemBuilder: (context, index) {
                                return Weakness(
                                    weakness: pokemonModel
                                        .pokemon?[this.index].weaknesses?[index]);
                              },
                              physics: NeverScrollableScrollPhysics(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
