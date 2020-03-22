import 'package:debate_circle/Models/Category.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  Category _category;

  CategoryListPage(int id) {
    this._category = Category.fromId(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _category.colors[0],
        title: Text(_category.name),
      ),
      body: Center(
        child: Text(_category.name),
      ),
    );
  }
}
