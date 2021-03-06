import 'package:flutter/material.dart';

class LoaderComponent extends StatelessWidget {
  final String text;

  LoaderComponent({this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 130),
        width: 200,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.cyan[100], borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/loading.gif"),
            ),
            SizedBox(
              height: 25,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Cargando personajes...',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
