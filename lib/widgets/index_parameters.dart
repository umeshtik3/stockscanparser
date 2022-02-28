import 'package:flutter/material.dart';
import 'package:stockscanparser/utility/common/common_style.dart';

import '../data_models/data_models.dart';

class IndexParameters extends StatelessWidget {
  final Dollors? dollors;
  const IndexParameters({Key? key, required this.dollors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index parameter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Style.padding10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Style.padding10),
            child: Text(
              'Set Parameter',
              style: Style.text20(context),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: Style.padding10, horizontal: Style.padding10),
              decoration: const BoxDecoration(color: Style.dailyWhite),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Period',
                    style: Style.text18(context),
                  ),
                  SizedBox(
                    width: Style.width200,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: dollors!.defaultValue.toString(),
                    ),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
