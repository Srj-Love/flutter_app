import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class DrinkDetails extends StatelessWidget {
  final drinkSingle;

  const DrinkDetails({Key key, @required this.drinkSingle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(drinkSingle["strDrink"]),
            elevation: 0.0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: drinkSingle["idDrink"],
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: NetworkImage(drinkSingle["strDrinkThumb"]),
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  "${drinkSingle["idDrink"]}",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 30.0),
                Text(
                  "${drinkSingle["strDrink"]}",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
          )),
    );
  }
}
