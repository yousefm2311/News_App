// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api_new/layout/shared/component/component.dart';
import '../modules/search/search_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class News_App extends StatelessWidget {
  const News_App({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
      builder: (context, state) {
        NewsAppCubit cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  navigator(context, Search_Screen());
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeTheme();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeBottomNav(value);
            },
            items: cubit.bottomItems,
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
