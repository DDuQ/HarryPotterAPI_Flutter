import 'package:flutter/material.dart';
import 'package:harry_potter_api/models/character.dart';
import 'package:harry_potter_api/widgets/text_info.dart';

class CharacterDetails extends StatefulWidget {
  Character character;

  CharacterDetails({required this.character});

  @override
  _CharacterDetailsState createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
        centerTitle: true,
      ),
      body: Container(
        child: _displayCharacterDetails(),
      ),
    );
  }

  Widget _displayCharacterDetails() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Image(
            image: NetworkImage(widget.character.image),
            height: 300,
            width: 300,
          ),
          SizedBox(
            height: 15,
          ),
          TextInfo(text: 'Wand: ', fontSize: 20),
          TextInfo(
            text: widget.character.wand.core == "" &&
                    widget.character.wand.length == "" &&
                    widget.character.wand.wood == ""
                ? "This character does not have a Wand"
                : "Core: ${widget.character.wand.core} | Length: ${widget.character.wand.length} | Wood: ${widget.character.wand.wood}",
            fontSize: 15,
            color: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
          _displayInfoFields(),
        ],
      ),
    );
  }

  Widget _displayInfoFields() {
    return SafeArea(
      child: DataTable(
          sortColumnIndex: 1,
          sortAscending: false,
          columnSpacing: 120,
          dataRowHeight: 80,
          columns: [
            DataColumn(label: TextInfo(text: 'Patronus', fontSize: 15)),
            DataColumn(label: Text(widget.character.patronus)),
          ],
          rows: [
            DataRow(cells: [
              DataCell(TextInfo(text: 'Alternate Names', fontSize: 16)),
              DataCell(Text(widget.character.alternateNames[0] == ""
                  ? "None"
                  : widget.character.alternateNames.map((e) => e).toString())),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Specie', fontSize: 16)),
              DataCell(Text(widget.character.species)),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'House', fontSize: 16)),
              DataCell(Text(widget.character.house)),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Date Of Birth', fontSize: 16)),
              DataCell(Text(widget.character.dateOfBirth)),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Year Of Birth', fontSize: 16)),
              DataCell(Text(widget.character.yearOfBirth)),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Wizard', fontSize: 16)),
              DataCell(Text(
                  widget.character.wizard.toString().toString() == 'true'
                      ? "Yes"
                      : "No")),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Ancestry', fontSize: 16)),
              DataCell(Text(widget.character.ancestry)),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Eye Colour', fontSize: 16)),
              DataCell(Text(widget.character.eyeColour)),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Hair Colour', fontSize: 16)),
              DataCell(Text(widget.character.hairColour)),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Hogwarts Student', fontSize: 16)),
              DataCell(Text(
                  widget.character.hogwartsStudent.toString() == 'true'
                      ? "Yes"
                      : "No")),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Hogwarts Staff', fontSize: 16)),
              DataCell(Text(widget.character.hogwartsStaff.toString() == 'true'
                  ? "Yes"
                  : "No")),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Actor', fontSize: 16)),
              DataCell(Text(widget.character.actor)),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Alternate Actors', fontSize: 16)),
              DataCell(Text(widget.character.alternateActors[0] == ""
                  ? "None"
                  : widget.character.alternateActors.map((e) => e).toString())),
            ]),
            DataRow(cells: [
              DataCell(TextInfo(text: 'Alive', fontSize: 16)),
              DataCell(Text(
                  widget.character.alive.toString() == 'true' ? "Yes" : "No")),
            ]),
          ]),
    );
  }
}
