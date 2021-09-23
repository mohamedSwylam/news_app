import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';
import 'package:news_app/shared/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! NewsGetHeadlinesLoadingState,
          builder: (context) {
            return Scaffold(
                body: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: ConditionalBuilder(
                      condition: NewsCubit.get(context).headlines.length > 0 ,
                      builder: (context) {
                        return CarouselSlider.builder(
                          itemCount: NewsCubit.get(context).headlines.length,
                          itemBuilder: (context, index, pageViewIndex) {
                            var list = NewsCubit.get(context).headlines;
                            return buildHeadlinesItem(list[index], context);
                          },
                          options: CarouselOptions(
                            height: 300,
                            initialPage: 0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            enableInfiniteScroll: true,
                            pauseAutoPlayOnTouch: true,
                          ),
                        );
                      },
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Top Channels',
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
                SizedBox(
                  height: 7,
                ),
                Expanded(
                  child: Container(
                    height: 110,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var list = NewsCubit.get(context).channelCircle;
                          return buildCircleAvatar(list[index], context);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        itemCount: NewsCubit.get(context).channelCircle.length),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Hot News',
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      var list = NewsCubit.get(context).business;
                      return buildBusinessItem(list[index], context);
                    },
                    itemCount: NewsCubit.get(context).business.length,
                  ),
                ),
              ],
            ));
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
