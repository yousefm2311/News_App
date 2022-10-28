// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../layout/shared/component/component.dart';

class Sports_Screen extends StatelessWidget {
  const Sports_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
        builder: (context, state) {
          var list = NewsAppCubit.get(context).sports;
          return buildArticlesScreen(list, context);
        },
        listener: (context, state) {});
  }
}
