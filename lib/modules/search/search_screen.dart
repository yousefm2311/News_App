// ignore_for_file: body_might_complete_normally_nullable, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../layout/shared/component/component.dart';

class Search_Screen extends StatelessWidget {
  Search_Screen({super.key});

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
      builder: ((context, state) {
        var list = NewsAppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              defaultFormField(
                onChanged: (value) {
                  NewsAppCubit.get(context).getSearch(value);
                },
                context: context,
                text: "Search",
                type: TextInputType.text,
                perfix: Icons.search,
                controller: searchController,
              ),
              Expanded(
                  child: buildArticlesScreen(list, context, isSearch: true)),
            ],
          ),
        );
      }),
      listener: ((context, state) {}),
    );
  }
}
