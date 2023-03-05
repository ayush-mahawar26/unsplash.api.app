import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api/constants/theme.dart';
import 'package:unsplash_api/cubit/homecubit/home.cubit.dart';
import 'package:unsplash_api/cubit/homecubit/home.state.dart';
import 'package:unsplash_api/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageLoadCubit>(create: (context) => ImageLoadCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes().routers,
        initialRoute: "/home",
        theme: AppTheme().appThemeData(),
      ),
    );
  }
}
