// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api_new/layout/cubit/states.dart';
import '../../modules/business/business.dart';
import '../../modules/science/science.dart';
import '../../modules/settings/settings.dart';
import '../../modules/sports/sports.dart';
import '../shared/component/component.dart';
import '../shared/local/cache_helper.dart';
import '../shared/remote/dio.dart';

class NewsAppCubit extends Cubit<NewsAppState> {
  NewsAppCubit() : super(NewsInitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Businees'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> Screens = [
    const Businees_Screen(),
    const Science_Screen(),
    const Sports_Screen(),
    const Settings_Screen(),
  ];
  String? country;
  void changeCountry(String c,context) {
    country = c;
    navigator(context, const Businees_Screen());
    print(c);
    emit(NewsChangeCountryState());
  }

  bool isDark = false;
  void changeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeThemeState());
      });
    }
  }

  int currentIndex = 0;
  void changeBottomNav(int value) {
    currentIndex = value;
    // if (value == 1) {
    //   getScience();
    // }
    // if (value == 2) {
    //   getSports();
    // }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    Dio_Helper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '016e4448343c445285eec16f36af4576',
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print("error1 ${error.toString()}");
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      Dio_Helper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '016e4448343c445285eec16f36af4576'
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      Dio_Helper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '016e4448343c445285eec16f36af4576'
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String? index) {
    emit(NewsGetSearchLoadingState());
    Dio_Helper.getData(url: 'v2/everything', query: {
      'q': '$index',
      'apiKey': '016e4448343c445285eec16f36af4576'
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErroState(error.toString()));
    });
  }
}
