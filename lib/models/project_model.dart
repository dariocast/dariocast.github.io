import 'package:flutter/material.dart';

class Project {
  String image;
  String darkImage;
  String name;
  String description;
  String link;
  Project(
      {@required this.image,
      this.darkImage,
      @required this.name,
      @required this.description,
      this.link});
}
