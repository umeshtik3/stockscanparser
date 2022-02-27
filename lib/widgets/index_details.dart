// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:stockscanparser/data_models/data_models.dart';
import 'package:stockscanparser/utility/common/common_style.dart';
import 'package:stockscanparser/widgets/index_parameters.dart';
import 'package:stockscanparser/widgets/list_parameters.dart';

class IndexDetail extends StatefulWidget {
  final Indexes stockIndex;

  const IndexDetail({
    Key? key,
    required this.stockIndex,
  }) : super(key: key);

  @override
  State<IndexDetail> createState() => _IndexDetailState();
}

class _IndexDetailState extends State<IndexDetail> {
  List<Criterion>? _criterionList;
  final Indexes _stockIndex = Indexes();
  @override
  void initState() {
    super.initState();
    _criterionList = widget.stockIndex.criteria;
    _stockIndex.name = widget.stockIndex.name;
    _stockIndex.tag = widget.stockIndex.tag;
  }

  Criterion extractCriteriaText(int index) {
    Criterion criterion = Criterion();
    criterion.text = _criterionList![index].text;
    criterion.type = _criterionList![index].type;
    criterion.variable = _criterionList![index].variable;

    return criterion;
  }

  Widget stringManipulation(String? str, Variable? variable) {
    final RegExp regex = RegExp(r"\$(\d+)");
    String text = str!;
    final List<InlineSpan> textSpans = [];
    final Iterable<Match> matches = regex.allMatches(text);
    int start = 0;
    for (final Match match in matches) {
      textSpans.add(TextSpan(text: text.substring(start, match.start)));
      textSpans.add(WidgetSpan(
          child: GestureDetector(
              onTap: () {
                print("You tapped \$${match.group(1)}");
                // var a = variable!.dollors!.f.containsValue('\$${match.group(1)}');
                variable!.dollors!.forEach((element) {
                  element.forEach((key, value) {
                    var a = key.contains('\$${match.group(1)}');
                    if (a) {
                      if (value is Dollors) {
                        Dollors d = value;
                        // print(d.defaultValue);
                        print(d.values != null ? d.values.toString() : d.defaultValue.toString());

                        _launchNextPage(context, d);
                      }
                    }
                  });
                });
              },
              child: Text('\$${match.group(1)}', style: const TextStyle(color: Colors.blue)))));
      start = match.end;
    }
    textSpans.add(TextSpan(text: text.substring(start, text.length)));
    return Text.rich(TextSpan(children: textSpans));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Criteria'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Style.lightBlue),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _stockIndex.name!,
                          style: Style.text19(context),
                        ),
                        Text(
                          _stockIndex.tag!,
                          style: Style.text15(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _criterionList!.length,
                itemBuilder: (context, index) {
                  Criterion _criteria = extractCriteriaText(index);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: _criteria.variable == null
                              ? Text(_criteria.text.toString(), style: Style.text16(context))
                              : stringManipulation(_criteria.text, _criteria.variable))
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }

  void _launchNextPage(BuildContext context, Dollors? dollors) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                dollors!.values == null ? IndexParameters(dollors: dollors) : ListParameters(dollors: dollors)));
  }
}
