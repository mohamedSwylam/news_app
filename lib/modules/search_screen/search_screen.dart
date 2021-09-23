import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  labelText: 'Search',
                  borderRaduis: 20,
                  errorBorderRaduis: 20,
                  focusedBorderRaduis: 20,
                  prefix: Icons.search,
                  labelColor: Colors.teal,
                  fillcolor: Colors.teal,
                  iconColor: Colors.teal,
                  focusColor: Colors.teal,
                  enabledBorderColor: Colors.teal,
                  enabledBorderRaduis: 20,
                  errorBorderColor: Colors.teal,
                  cursorColor: Colors.teal,
                  focusdborderColor: Colors.teal,
                  borderColor: Colors.teal,
                  onchange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Search Must Not Be Empty !!!';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Expanded(child: buildSource(list, context,isSearch: true,)),
            ],
          ),
        );
      },
    );
  }
}
