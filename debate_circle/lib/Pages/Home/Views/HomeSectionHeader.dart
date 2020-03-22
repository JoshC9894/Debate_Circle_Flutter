import 'package:flutter/material.dart';

class HomeSectionHeader extends StatelessWidget {
  final String title;
  final Function method;

  HomeSectionHeader(this.title, this.method);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey.shade900,
                ),
              ),
              FlatButton(
                onPressed: method,
                child: Text(
                  "See all",
                  style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}