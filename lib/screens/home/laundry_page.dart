import 'package:flutter/material.dart';

class LaundryPage extends StatelessWidget {
  const LaundryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (int i = 0; i < 10; i++)
              Container(
                height: 100,
                width: 100,
                child: Card(
                  child: Text("Hello!"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
