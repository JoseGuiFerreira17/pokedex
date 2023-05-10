import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/components/app_bar.dart';
import 'package:pokedex/components/poke_item.dart';
import 'package:pokedex/core/consts.dart';
import 'package:pokedex/models/pokeapi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeAPI? listPokemon;
  @override
  void initState() {
    super.initState();
    getPokemons();
  }

  Future<void> getPokemons() async {
    final response = await Dio().get(ConstsAPI.pokeapiURL);
    listPokemon = PokeAPI.fromJson(json.decode(response.data));
    print(listPokemon);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -(240 / 4.7),
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                ConstsAPI.blackPokeball,
                height: 240,
                width: 240,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: statusWidth,
              ),
              const AppBarHome(),
              (listPokemon != null)
                  ? Expanded(
                      child: AnimationLimiter(
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(12),
                          addAutomaticKeepAlives: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: listPokemon!.pokemon!.length,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 2,
                              child: ScaleAnimation(
                                child: GestureDetector(
                                  child: PokeItem(
                                    types: listPokemon!.pokemon![index].type!,
                                    index: index,
                                    name: listPokemon!.pokemon![index].name!,
                                    num: listPokemon!.pokemon![index].num!,
                                  ),
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (BuildContext context) =>
                                    //           Container() /*PokeDetailPage(index: index)*/,
                                    //       fullscreenDialog: true,
                                    //     ));
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
