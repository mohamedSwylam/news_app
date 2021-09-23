import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
             /* leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),*/
              title: Text('Egypt News'),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: IconButton(
                    icon: Icon(Icons.brightness_4_sharp),
                    onPressed: ()=> cubit.changeThemeMode(),
                  ),
                ),
              ],
            ),
            body: NewsCubit.get(context)
                .screens[NewsCubit.get(context).currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: NewsCubit.get(context).isDark ? Colors.black : Colors.white,
              color: Colors.teal,
              height: 50,
              buttonBackgroundColor: Colors.teal,
              items: cubit.bottomCurvedItem,
              onTap: (index) => cubit.changeNaveBarItem(index),
            ),
          );
        });
  }
}
