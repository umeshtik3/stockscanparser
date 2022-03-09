import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stockscanparser/widgets/index_parameters.dart';
import 'package:stockscanparser/widgets/list_parameters.dart';

import 'data_models/data_models.dart';
import 'utility/common/common_style.dart';
// import 'package:stockscanparser/backend/api/api_manager.dart';
// import 'package:stockscanparser/repository.dart';

class IndexBloc {
  final stockIndexListStreamController = StreamController();

  StreamSink get stockSink => stockIndexListStreamController.sink;
  Stream get stockStream => stockIndexListStreamController.stream;

  // final _repository = Repository();

}

extension ClickableText on Text {
  Widget convertIntoClickableText(
      BuildContext context, String? str, Variable? variable) {
    final RegExp regex = RegExp(r"\$(\d+)");
    String text = str!;
    final List<InlineSpan> textSpans = [];
    final Iterable<Match> matches = regex.allMatches(text);
    int start = 0;
    for (final Match match in matches) {
      textSpans.add(TextSpan(
          text: text.substring(start, match.start),
          style: Style.text20(context)));
      textSpans.add(WidgetSpan(
          child: GestureDetector(
              onTap: () {
                for (var dollor in variable!.dollors!) {
                  dollor.forEach((key, value) {
                    var isKeyFound = key.contains('\$${match.group(1)}');
                    if (isKeyFound) {
                      if (value is Dollors) {
                        Dollors d = value;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => d.values == null
                                    ? IndexParameters(dollors: d)
                                    : ListParameters(dollors: d)));
                      }
                    }
                  });
                }
              },
              child: Text('\$${match.group(1)}',
                  style: const TextStyle(color: Colors.blue, fontSize: 18)))));
      start = match.end;
    }
    textSpans.add(TextSpan(
        text: text.substring(start, text.length),
        style: Style.text20(context)));
    return Text.rich(TextSpan(children: textSpans));
  }
}
