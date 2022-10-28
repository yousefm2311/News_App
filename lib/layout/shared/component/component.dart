// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, avoid_types_as_parameter_names
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api_new/modules/web_view/web_view.dart';

import '../../cubit/cubit.dart';

Widget buildArticles(articles, context) => InkWell(
      onTap: (() {
        navigator(context, Web_View_Screen(url: articles['url']));
      }),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: articles['urlToImage'] != null
                    ? DecorationImage(
                        image: NetworkImage(
                          '${articles["urlToImage"]}',
                        ),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: NetworkImage(
                            "https://www.gearcouplingsindia.com/wp-content/uploads/2017/11/page_404.jpg"),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(
              width: 14.0,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${articles["title"]}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Text('${articles["publishedAt"]}',
                        style: const TextStyle(
                            fontSize: 13.0, color: Colors.grey)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget buildArticlesScreen(list, context,{isSearch = false}) => ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) {
      return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return buildArticles(list[index], context);
          },
          separatorBuilder: (context, index) {
            return const SizedBox();
          },
          itemCount: list.length);
    },
    fallback: (context) {
      return isSearch? Container(): const Center(
        child: CircularProgressIndicator(),
      );
    });

Widget defaultFormField({
  context,
  required String text,
  required TextInputType type,
  required IconData perfix,
  required TextEditingController controller,
  IconData? suffix,
  VoidCallback? suffixButton,
  bool isPassword = false,
  String? Function(String?)? validator,
  String? Function(String?)? onChanged,
  VoidCallback? ontap,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        obscureText: isPassword,
        keyboardType: type,
        style: Theme.of(context).textTheme.bodySmall,
        onTap: ontap,
        cursorColor:
            NewsAppCubit.get(context).isDark ? Colors.white : Colors.black,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          labelText: text,
          labelStyle: Theme.of(context).textTheme.titleSmall,
          hintText: text,
          helperText: 'Type Text to Search',
          helperStyle: Theme.of(context).textTheme.titleSmall,
          hintStyle: NewsAppCubit.get(context).isDark
              ? const TextStyle(color: Colors.white)
              : const TextStyle(color: Colors.grey),
          floatingLabelStyle: Theme.of(context).textTheme.titleSmall,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade500, width: 2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: NewsAppCubit.get(context).isDark
                ? BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.5)
                : BorderSide(color: Colors.black.withOpacity(0.5), width: 1.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(perfix,
              color: NewsAppCubit.get(context).isDark
                  ? Colors.grey[200]
                  : Colors.grey),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixButton,
                  icon: Icon(suffix),
                )
              : null,
        ),
      ),
    );

void navigator(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
