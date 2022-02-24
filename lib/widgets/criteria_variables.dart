import 'package:flutter/material.dart';
import 'package:stockscanparser/data_models/data_models.dart';

class CriteriaVariables extends StatelessWidget {
  final Variable? variable;
  CriteriaVariables({Key? key, this.critionList, this.variable, this.the1, this.the2, this.the3, this.the4})
      : super(key: key);
  The1? the1 = The1();
  The1? the2 = The1();
  The1? the3 = The1();
  The1? the4 = The1();
  final List<Criterion>? critionList;
  void getData() {
    the1!.values = variable?.the1!.values;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(the4!.defaultValue.toString())],
    );
  }
}
