// ignore_for_file: prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../layout/shared/component/component.dart';


class Businees_Screen extends StatelessWidget {
  const Businees_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
        builder: (context, state) {
          var list = NewsAppCubit.get(context).business;
          return buildArticlesScreen(list, context);
        },
        listener: (context, state) {});
  }
}
