import 'package:flutter/material.dart';

import '../data_models/data_models.dart';

class IndexParameters extends StatefulWidget {
  final Dollors? dollors;
  const IndexParameters({Key? key, required this.dollors}) : super(key: key);

  @override
  _IndexParametersState createState() => _IndexParametersState();
}

class _IndexParametersState extends State<IndexParameters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(widget.dollors!.defaultValue.toString())),
    );
  }
}
