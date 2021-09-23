import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/shared/styles/themes/themes.dart';
import 'modules/new_layout/new_layout.dart';
import 'modules/onboarding/onboarding_screen.dart';
import 'network/remote/dio_helper.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

  Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(NewsIntialState())
        ..getHeadlines()
        ..getBusiness()
        ..getSports()
        ..getHealth()
        ..getEntertainment()
        ..getScience()
        ..getTechnology()
        ..getChannel()..changeThemeMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: OnboardingScreen(),
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
