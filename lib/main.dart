// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api_new/layout/cubit/blocobserver.dart';
import 'package:news_app_api_new/layout/cubit/cubit.dart';
import 'package:news_app_api_new/layout/shared/local/cache_helper.dart';
import 'package:news_app_api_new/layout/shared/remote/dio.dart';
import 'layout/cubit/states.dart';
import 'layout/newsapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Dio_Helper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(
    isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark, {super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsAppCubit()
        ..getBusiness()
        ..getScience()
        ..getSports()
        ..changeTheme(fromShared: isDark),
      child: BlocConsumer<NewsAppCubit, NewsAppState>(
        builder: (context, state) {
          NewsAppCubit cubit = NewsAppCubit.get(context);
          return MaterialApp(
            title: 'News_App',
            theme: ThemeData(
              textTheme: const TextTheme(
                  bodySmall: TextStyle(color: Colors.black),
                  titleSmall: TextStyle(color: Colors.grey),
                  bodyMedium: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600)),
              primarySwatch: Colors.deepOrange,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
              ),
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                backgroundColor: Colors.deepOrange,
                titleTextStyle: TextStyle(fontSize: 22.0),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.deepOrange,
                  statusBarBrightness: Brightness.dark,
                ),
              ),
            ),
            darkTheme: ThemeData(
                textTheme: const TextTheme(
                    bodySmall: TextStyle(color: Colors.white),
                    titleSmall: TextStyle(color: Colors.white),
                    bodyMedium: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
                primarySwatch: Colors.blue,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.black26,
                  type: BottomNavigationBarType.fixed,
                ),
                appBarTheme: const AppBarTheme(
                  titleSpacing: 20.0,
                  backgroundColor: Colors.black26,
                  titleTextStyle: TextStyle(fontSize: 22.0),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black26,
                    statusBarBrightness: Brightness.dark,
                  ),
                ),
                scaffoldBackgroundColor: Colors.black),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const Directionality(
              textDirection: TextDirection.ltr,
              child: News_App(),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
