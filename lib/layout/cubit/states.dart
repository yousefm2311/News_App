abstract class NewsAppState {}

class NewsInitialState extends NewsAppState {}

class NewsChangeThemeState extends NewsAppState {}
class NewsChangeCountryState extends NewsAppState {}

class NewsChangeColorTextState extends NewsAppState {}

class NewsBottomNavState extends NewsAppState {}

class NewsGetBusinessSuccessState extends NewsAppState {}

class NewsGetBusinessErrorState extends NewsAppState {
  final String error;

  NewsGetBusinessErrorState(this.error);
}


class NewsGetBusinessLoadingState extends NewsAppState {}

class NewsGetSportsSuccessState extends NewsAppState {}

class NewsGetSportsErrorState extends NewsAppState {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsAppState {}

class NewsGetScienceSuccessState extends NewsAppState {}

class NewsGetScienceErrorState extends NewsAppState {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsAppState {}



class NewsGetSearchState extends NewsAppState {}

class NewsGetSearchErroState extends NewsAppState {
  final String error;

  NewsGetSearchErroState(this.error);
}

class NewsGetSearchLoadingState extends NewsAppState {}
