import 'package:flutter/material.dart';
import 'package:stockscanparser/data_models/data_models.dart';

class CriteriaVariables extends StatelessWidget {
  final Variable? variable;
  const CriteriaVariables({Key? key, this.critionList, this.variable}) : super(key: key);

  final List<Criterion>? critionList;
  void getData() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [Text('hi')],
    );
  }
}
