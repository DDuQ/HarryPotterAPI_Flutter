import 'package:flutter/material.dart';
import 'package:harry_potter_api/models/character.dart';

class CharacterInfo extends StatelessWidget {
  final Character character;
  const CharacterInfo({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        centerTitle: true,
      ),
    );
  }
}
