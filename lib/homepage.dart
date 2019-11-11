import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/drink_details.dart';
import 'package:flutter_app/main.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var resp, drink;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    resp = await http.get(url);
    drink = jsonDecode(resp.body)["drinks"];
    print(drink.toString());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var noImage =
        "https://1m19tt3pztls474q6z46fnk9-wpengine.netdna-ssl.com/wp-content/themes/unbound/images/No-Image-Found-400x264.png";
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Coctail App"),
          elevation: 0.0,
        ),
        body: Center(
            child: resp != null
                ? ListView.builder(
                    itemCount: drink.length,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var drinkSingle = drink[index];
//                    print(index);
                      return ListTile(
                        leading: Hero(
                          tag: drinkSingle["idDrink"],
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(drinkSingle["strDrinkThumb"]) ??
                                    noImage,
                          ),
                        ),
                        title: Text(
                          "${drinkSingle["strDrink"]}",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        subtitle: Text(
                          "${drinkSingle["idDrink"]}",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DrinkDetails(drinkSingle: drinkSingle),
                                  fullscreenDialog: true));
                        },
                      );
                    })
                : CircularProgressIndicator(backgroundColor: Colors.white)),
      ),
    );
  }
}
