import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter_api/components/loader_component.dart';
import 'package:harry_potter_api/helpers/api_helper.dart';
import 'package:harry_potter_api/models/character.dart';
import 'package:harry_potter_api/models/response.dart';
import 'package:harry_potter_api/screens/character_info_screen.dart';
import 'package:harry_potter_api/widgets/text_info.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  bool _hasInternet = false;
  bool _isFiltered = false;
  String _search = '';

  List<Character> _characters = [];
  bool _showLoader = false;

  @override
  void initState() {
    super.initState();
    _getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: _showLoader
                      ? LoaderComponent()
                      : Column(
                          children: _characters.map((character) {
                            return characterInfo(context, width, character);
                          }).toList(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector characterInfo(
      BuildContext context, double width, Character character) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterInfo(character: character),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 250,
        child: Stack(
          children: [
            Positioned(
              top: 35,
              child: new Material(
                elevation: 0.0,
                child: new Container(
                  height: 180.0,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0.0),
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: new Offset(0.0, 0.0),
                          blurRadius: 20.0,
                          spreadRadius: 4.0)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 10,
              child: Card(
                elevation: 10.0,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(character.image),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: width * 0.5,
              child: Container(
                height: 200,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextInfo(text: character.name, fontSize: 22),
                    Divider(
                      color: Colors.black,
                    ),
                    TextInfo(
                        text: 'House: ${character.house}',
                        fontSize: 15,
                        color: Colors.grey),
                    TextInfo(
                        text: 'Specie: ${character.species}',
                        fontSize: 15,
                        color: Colors.grey),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _getCharacters() async {
    setState(() {
      _showLoader = true;
    });

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      checkInternetError();
      return;
    }

    Response response = await ApiHelper.getCharacters();

    setState(() {
      _showLoader = false;
    });

    if (!response.isSuccess) {
      await showAlertDialog(
          context: context,
          title: 'Error',
          message: response.message,
          actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar')
          ]);
      return;
    }

    setState(() {
      _characters = response.result;
    });
  }

  Widget _getContent() {
    return _characters.length == 0 ? _noContent() : _getListView(context);
  }

  Widget _noContent() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Text(
          _isFiltered
              ? 'No hay personajes con ese criterio de búsqueda.'
              : 'No hay personajes registrados.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _getListView(context) {
    final double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: _getCharacters,
      child: Column(
        children: _characters.map((character) {
          return characterInfo(context, width, character);
        }).toList(),
      ),
    );
  }

  Center checkInternetError() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        child: Text('Check internet'),
        onPressed: () => _hasConectivity(),
      ),
    );
  }

  void _hasConectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _hasInternet = false;
      });
    } else {
      setState(() {
        _hasInternet = true;
      });
    }
  }
}
