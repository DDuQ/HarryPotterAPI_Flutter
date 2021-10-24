import 'package:flutter/material.dart';

class LoaderComponent extends StatelessWidget {
  final String text;

  LoaderComponent({this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loading.gif"), fit: BoxFit.cover),
            color: Colors.blueGrey[500],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
