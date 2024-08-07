import 'package:flutter/material.dart';

class ListViewModel extends ChangeNotifier {
  List<Genre> categories = [
    Genre(title: 'All Releases', selected: true),
    Genre(title: 'Top', selected: false),
    Genre(title: 'New', selected: false),
    Genre(title: 'Favourite', selected: false),
    Genre(title: 'Recommended', selected: false),
  ];
}
class Genre {
  String title;
  bool selected;
  Genre({
    required this.title,
    required this.selected,
  });
}