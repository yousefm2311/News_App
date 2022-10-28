// ignore_for_file: avoid_print, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api_new/layout/cubit/cubit.dart';
import 'package:news_app_api_new/layout/cubit/states.dart';

import '../../layout/shared/component/component.dart';
import '../business/business.dart';

class Settings_Screen extends StatelessWidget {
  const Settings_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    NewsAppCubit cubit = NewsAppCubit.get(context);
    return BlocConsumer<NewsAppCubit, NewsAppState>(
      builder: ((context, state) {
        return Center(
          child: Column(
            children: [
              MaterialButton(
                onPressed: (() {
                  cubit.changeCountry('eg', context);
                }),
                child: const Text('Egypt'),
              ),
              MaterialButton(
                onPressed: (() {
                  cubit.country = 'us';
                  navigator(context, const Businees_Screen());
                }),
                child: const Text('Us'),
              ),
            ],
          ),
        );
      }),
      listener: ((context, state) {}),
    );
  }
}
