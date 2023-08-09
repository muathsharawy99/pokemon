import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/view/screens/home_screen.dart';

import 'view_model/dio_helper/dio_helper.dart';
import 'view_model/pokemon_cubit/pokemon_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.InitDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PokemonCubit()..getPokemon(),
            ),
          ],
          child: MaterialApp(
            theme: ThemeData(primarySwatch: Colors.cyan),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}
