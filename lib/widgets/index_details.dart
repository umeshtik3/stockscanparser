import 'package:flutter/material.dart';
import 'package:stockscanparser/data_models/data_models.dart';
import 'package:stockscanparser/utility/common/common_style.dart';

class IndexDetail extends StatefulWidget {
  final String title;
  final String tag;
  final Indexes stockIndex;
  final List<Criterion>? criteriaList;

  const IndexDetail({
    Key? key,
    required this.title,
    required this.stockIndex,
    required this.tag,
    required this.criteriaList,
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
    _criterionList = widget.criteriaList;
    _stockIndex.name = widget.stockIndex.name;
    _stockIndex.tag = widget.stockIndex.tag;
  }

  Criterion extractCriteriaText(int index) {
    Criterion criterion = Criterion();
    criterion.text = _criterionList![index].text;
    criterion.type = _criterionList![index].type;

    return criterion;
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
                          child: Text(_criteria.text.toString(), style: Style.text16(context)))
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
