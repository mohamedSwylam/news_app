import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class SourceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return DefaultTabController(
          length: NewsCubit.get(context).sourceScreens.length,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 50,
              bottom: TabBar(
                physics: BouncingScrollPhysics(),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.tealAccent
                ),
                isScrollable: true,
                tabs: NewsCubit.get(context).tabBarItem,
                onTap: (index) => NewsCubit.get(context).changeTabBarItem(index),
              ),
            ),
            body: NewsCubit.get(context).sourceScreens[NewsCubit.get(context).currentTabIndex],
          ),
        );
      },
    );
  }
}
