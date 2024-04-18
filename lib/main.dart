import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_mobile_project/app_colors.dart';
import 'package:test_flutter_mobile_project/app_styles.dart';
import 'package:test_flutter_mobile_project/pages/create_page.dart';
import 'package:test_flutter_mobile_project/pages/home.dart';

import 'bloc/ItemCubit.dart';
import 'bloc/SelectedDateCubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  ItemCubit(DateTime.now())..loadItemsByDate()),
          BlocProvider(create: (context) => SelectedDateCubit(DateTime.now())),
        ],
        child: MaterialApp(
          title: 'Thoughtful',
          theme: ThemeData(
            textTheme: AppStyles.textTheme,
            colorScheme: const ColorScheme.dark(
              brightness: Brightness.dark,
              primary: AppColors.gradient1,
              secondary: AppColors.gradient2,
            ),
            useMaterial3: true,
          ),
          routes: {
            '/home': (context) => const HomePage(),
            '/create': (context) => CreatePage(),
          },
          home: const HomePage(),
        ));
  }
}
