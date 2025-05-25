// favorite_provider.dart

import 'package:flutter/foundation.dart';
import 'package:ilet/Model/favoriteModel.dart';

class FavoriteProvider with ChangeNotifier {
  List<CourseModel> _favoriteCourses = [];

  List<CourseModel> get favoriteCourses => _favoriteCourses;

  void addFavorite(CourseModel course) {
    _favoriteCourses.add(course);
    notifyListeners();
  }

  void removeFavorite(CourseModel course) {
    _favoriteCourses.remove(course);
    notifyListeners();
  }

  void toggleFavorite(CourseModel course) {
    if (course.isFavorite) {
      removeFavorite(course);
    } else {
      addFavorite(course);
    }
  }
}
