import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/entertainment_screen/entertainment_screen.dart';
import 'package:news_app/modules/health_screen/health_screen.dart';
import 'package:news_app/modules/home_screen/home_screen.dart';
import 'package:news_app/modules/personal_screen/personal_screen.dart';
import 'package:news_app/modules/science_screen/science_screen.dart';
import 'package:news_app/modules/search_screen/search_screen.dart';
import 'package:news_app/modules/sources_screen/sources_screen.dart';
import 'package:news_app/modules/sports_screen/sports_screen.dart';
import 'package:news_app/modules/technology_screen/technology_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/shared/constants.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit(initialState) : super(initialState);

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int currentTabIndex = 0;
  List<Widget> bottomCurvedItem = [
    Icon(Icons.home, size: 25),
    Icon(Icons.widgets_outlined, size: 25),
    Icon(Icons.search, size: 25),
   // Icon(Icons.person, size: 25),
  ];
  List<Tab> tabBarItem = [
    Tab(
      text: 'Sports',
    ),
    Tab(
      text: 'Health',
    ),
    Tab(text: 'Entertainment'),
    Tab(text: 'Science'),
    Tab(text: 'Technology'),
  ];
  List<BottomNavyBarItem> bottomNavItems = [
    BottomNavyBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
        activeColor: Colors.black,
        inactiveColor: Colors.grey),
    BottomNavyBarItem(
        icon: Icon(Icons.widgets_outlined),
        title: Text('Source'),
        activeColor: Colors.black,
        inactiveColor: Colors.grey),
    BottomNavyBarItem(
        icon: Icon(Icons.search),
        title: Text('Search'),
        activeColor: Colors.black,
        inactiveColor: Colors.grey),
    BottomNavyBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile'),
        activeColor: Colors.black,
        inactiveColor: Colors.grey),
  ];
  List<Widget> screens = [
    HomeScreen(),
    SourceScreen(),
    SearchScreen(),
    PersonalScreen(),
  ];
  List<Widget> sourceScreens = [
    SportsScreen(),
    HealthScreen(),
    EntertainmentScreen(),
    ScienceScreen(),
    TechnologyScreen(),
  ];

  void changeNaveBarItem(int index) {
    currentIndex = index;
    emit(NewsNavigationChangeState());
  }

  void changeTabBarItem(int index) {
    currentTabIndex = index;
    emit(NewsTabBarChangeState());
  }

  List<dynamic> headlines = [];

  void getHeadlines() {
    emit(NewsGetHeadlinesLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'apiKey': '8cf81d92f5a346f69140cfd65f1c2d47',
      },
    ).then((value) {
      headlines = value.data['articles'];
      print(headlines[0]['title']);
      emit(NewsGetHeadlinesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetHeadlinesErrorState(error.toString()));
    });
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '8cf81d92f5a346f69140cfd65f1c2d47',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '8cf81d92f5a346f69140cfd65f1c2d47',
      },
    ).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> health = [];

  void getHealth() {
    emit(NewsGetHealthLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'health',
        'apiKey': '8cf81d92f5a346f69140cfd65f1c2d47',
      },
    ).then((value) {
      health = value.data['articles'];
      print(health[0]['title']);
      emit(NewsGetHealthSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetHealthErrorState(error.toString()));
    });
  }

  List<dynamic> entertainment = [];

  void getEntertainment() {
    emit(NewsGetEntertainmentLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'entertainment',
        'apiKey': '8cf81d92f5a346f69140cfd65f1c2d47',
      },
    ).then((value) {
      entertainment = value.data['articles'];
      print(entertainment[0]['title']);
      emit(NewsGetEntertainmentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetEntertainmentErrorState(error.toString()));
    });
  }

  //List<dynamic> science = [];

  /* void getScience()
  {
    emit(NewsGetScienceLoadingState());

    if(science.length == 0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'science',
          'apiKey':'8cf81d92f5a346f69140cfd65f1c2d47',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else
    {
      emit(NewsGetScienceSuccessState());
    }
  }*/
  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '8cf81d92f5a346f69140cfd65f1c2d47',
      },
    ).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> technology = [];

  void getTechnology() {
    emit(NewsGetTechnologyLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': '8cf81d92f5a346f69140cfd65f1c2d47',
      },
    ).then((value) {
      technology = value.data['articles'];
      print(technology[0]['title']);
      emit(NewsGetTechnologySuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetTechnologyErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '8cf81d92f5a346f69140cfd65f1c2d47',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  List<dynamic> channelCircle = [];

  void getChannel() {
    emit(NewsGetChannelLoadingState());
    channelCircle = channel['articles'];
    emit(NewsGetChannelState());
  }

  bool isDark = false;

  void changeThemeMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeThemeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {});
      emit(NewsChangeThemeModeState());
    }
  }
}
