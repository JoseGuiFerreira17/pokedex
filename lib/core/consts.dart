// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ConstsAPI {
  static String pokeapiURL =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  static const String whitePokeball = 'assets/images/pokeball.png';
  static const String blackPokeball = 'assets/images/pokeball_dark.png';

  static Color getColorType({required String type}) {
    switch (type) {
      case 'Normal':
        return Color.fromRGBO(141, 110, 99, 1);

      case 'Fire':
        return Colors.red;

      case 'Water':
        return Colors.blue;

      case 'Grass':
        return Colors.green;

      case 'Electric':
        return Colors.amber;

      case 'Ice':
        return Color.fromRGBO(0, 229, 255, 1);

      case 'Fighting':
        return Colors.orange;

      case 'Poison':
        return Colors.purple;

      case 'Ground':
        return Color.fromRGBO(255, 183, 77, 1);

      case 'Flying':
        return Color.fromRGBO(159, 168, 218, 1);

      case 'Psychic':
        return Colors.pink;

      case 'Bug':
        return Color.fromRGBO(139, 195, 74, 1);

      case 'Rock':
        return Colors.grey;

      case 'Ghost':
        return Color.fromRGBO(92, 107, 192, 1);

      case 'Dark':
        return Colors.brown;

      case 'Dragon':
        return Color.fromRGBO(40, 53, 147, 1);

      case 'Steel':
        return Colors.blueGrey;

      case 'Fairy':
        return Color.fromRGBO(255, 128, 171, 1);

      default:
        return Colors.grey;
    }
  }
}
