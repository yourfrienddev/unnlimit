import 'package:flutter/material.dart';


class JokeTileWidget extends StatelessWidget {
  String joke;
  JokeTileWidget({Key? key,required this.joke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(joke),
      ),
    );
  }
}
