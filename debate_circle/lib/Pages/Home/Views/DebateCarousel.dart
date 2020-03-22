import 'package:debate_circle/Models/Debate.dart';
import 'package:flutter/material.dart';

class DebateCarousel extends StatelessWidget {
  final List<Debate> _debates;
  final Function _method;

  DebateCarousel(this._debates, this._method);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      height: 185,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _debates.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => _method(_debates[index]),
            child: Container(
              width: 340,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 16,
                    top: 4,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      width: 300,
                      height: 140,
                      child: Center(
                        child: Text(_debates[index].title),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 65.0,
                          height: 65.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
