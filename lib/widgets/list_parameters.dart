import 'package:flutter/material.dart';
import 'package:stockscanparser/data_models/data_models.dart';

class ListParameters extends StatefulWidget {
  final Dollors? dollors;
  const ListParameters({Key? key, required this.dollors}) : super(key: key);

  @override
  _ListParametersState createState() => _ListParametersState();
}

class _ListParametersState extends State<ListParameters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(widget.dollors!.values.toString()),
        ));
  }
}
