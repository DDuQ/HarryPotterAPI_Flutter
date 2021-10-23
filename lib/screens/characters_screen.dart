import 'package:flutter/material.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
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
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(Icons.arrow_back_ios, color: Color(0xFF363f93)),
                    onPressed: () => Navigator.pop(context)),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(Icons.home_outlined, color: Color(0xFF363f93)),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Container()))),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Container()));
                    },
                    child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        boxShadow: [
                                          new BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              offset: new Offset(0.0, 0.0),
                                              blurRadius: 20.0,
                                              spreadRadius: 4.0)
                                        ],
                                      ),
                                      // child: Text("This is where your content goes")
                                    ))),
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "http://hp-api.herokuapp.com/images/harry.jpg"),
                                          ),
                                        )))),
                            Positioned(
                                top: 45,
                                left: width * 0.4,
                                child: Container(
                                    height: 200,
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('data del personaje'),
                                      ],
                                    ))),
                          ],
                        )))
              ]),
            ),
          ),
        ],
      )),
    ));
  }
}
