// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../layout/shared/component/component.dart';

class Science_Screen extends StatelessWidget {
  const Science_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
        builder: (context, state) {
          var list = NewsAppCubit.get(context).science;
          return buildArticlesScreen(list,context);
        },
        listener: (context, state) {});
  }
}
