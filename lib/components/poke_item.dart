// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/consts.dart';

class PokeItem extends StatelessWidget {
  final String name;
  final int index;
  final Color? color;
  final String num;
  final List<String> types;

  Widget setTipos() {
    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(
        Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: const TextStyle(
                      fontFamily: 'Google',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      );
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lista,
    );
  }

  const PokeItem(
      {required this.name,
      required this.index,
      this.color,
      required this.num,
      required this.types});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ConstsAPI.getColorType(type: types[0]),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            //alignment: Alignment.bottomRight,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontFamily: 'Google',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: setTipos(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    ConstsAPI.whitePokeball,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CachedNetworkImage(
                  height: 80,
                  width: 80,
                  placeholder: (context, url) => Container(
                    color: Colors.transparent,
                  ),
                  imageUrl:
                      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
