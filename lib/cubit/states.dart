abstract class NewsStates{}
class NewsIntialState extends NewsStates{}
class NewsNavigationChangeState extends NewsStates{}
class NewsTabBarChangeState extends NewsStates{}
class NewsGetHeadlinesLoadingState extends NewsStates{}
class NewsGetHeadlinesSuccessState extends NewsStates{}
class NewsGetHeadlinesErrorState extends NewsStates{
  final String error;
  NewsGetHeadlinesErrorState(this.error);
}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  final String error;
  NewsGetSportsErrorState(this.error);
}
class NewsGetHealthLoadingState extends NewsStates{}
class NewsGetHealthSuccessState extends NewsStates{}
class NewsGetHealthErrorState extends NewsStates{
  final String error;
  NewsGetHealthErrorState(this.error);
}
class NewsGetEntertainmentLoadingState extends NewsStates{}
class NewsGetEntertainmentSuccessState extends NewsStates{}
class NewsGetEntertainmentErrorState extends NewsStates{
  final String error;
  NewsGetEntertainmentErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetTechnologyLoadingState extends NewsStates{}
class NewsGetTechnologySuccessState extends NewsStates{}
class NewsGetTechnologyErrorState extends NewsStates{
  final String error;
  NewsGetTechnologyErrorState(this.error);
}
class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}
class NewsGetChannelLoadingState extends NewsStates{}
class NewsGetChannelState extends NewsStates{}
class NewsChangeThemeModeState extends NewsStates{}



