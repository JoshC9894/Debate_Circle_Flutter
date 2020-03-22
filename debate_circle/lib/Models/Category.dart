import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  static List<Category> get all => [
    Category.fromId(0),
    Category.fromId(1),
    Category.fromId(2),
    Category.fromId(3),
    Category.fromId(4),
    Category.fromId(5),
    Category.fromId(6),
    Category.fromId(7),
    Category.fromId(8)
  ];

  int id;
  String name;
  String imgPath;
  List<Color> colors;
  IconData icon;

  Category(this.id, this.name, this.imgPath, this.colors, this.icon);

  Category.fromId(int id) {
    switch (id) {
      case 0:
        id = 0;
        name = "Science";
        imgPath = "assets/categories/science.jpg";
        colors = [Colors.red.shade900, Colors.red.shade300];
        icon = FontAwesomeIcons.dna;
        break;

      case 1:
        id = 1;
        name = "Technology";
        imgPath = "assets/categories/technology.jpeg";
        colors = [Colors.blue.shade700, Colors.blue.shade300];
        icon = FontAwesomeIcons.microchip;
        break;
        
      case 2:
        id = 2;
        name = "Politics";
        imgPath = "assets/categories/politics.jpg";
        colors = [Colors.purple.shade800, Colors.purple.shade200];
        icon = FontAwesomeIcons.voteYea;
        break;
        
      case 3:
        id = 3;
        name = "Religion";
        imgPath = "assets/categories/religion.jpeg";
        colors = [Colors.yellow.shade700, Colors.yellow.shade400];
        icon = FontAwesomeIcons.pray;
        break;
        
      case 4:
        id = 4;
        name = "Economics";
        imgPath = "assets/categories/economics.jpg";
        colors = [Colors.green.shade800, Colors.green.shade300];
        icon = FontAwesomeIcons.chartLine;
        break;
        
      case 5:
        id = 5;
        name = "Arts & Culture";
        imgPath = "assets/categories/art.jpg";
        colors = [Colors.indigo.shade900, Colors.indigo.shade400];
        icon = FontAwesomeIcons.theaterMasks;
        break;
        
      case 6:
        id = 6;
        name = "History";
        imgPath = "assets/categories/history.jpg";
        colors = [Colors.orange.shade800, Colors.orange.shade300];
        icon = FontAwesomeIcons.landmark;
        break;
        
      case 7:
        id = 7;
        name = "Philosophy";
        imgPath = "assets/categories/philosophy.jpg";
        colors = [Colors.pink.shade600, Colors.pink.shade200];
        icon = FontAwesomeIcons.yinYang;
        break;
        
      default:
        id = 8;
        name = "Other";
        imgPath = "assets/categories/other.jpg";
        colors = [Colors.blueGrey.shade600, Colors.blueGrey.shade300];
        icon = FontAwesomeIcons.question;
        break;
    }
  }
}