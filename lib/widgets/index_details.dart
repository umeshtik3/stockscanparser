import 'package:flutter/material.dart';
import 'package:stockscanparser/data_models/data_models.dart';

class IndexDetail extends StatefulWidget {
  final String title;
  final String tag;
  final list;
  final int? stockId;
  final List<Criterion>? criteriaList;
  final int index;
  const IndexDetail(
      {Key? key,
      required this.list,
      required this.title,
      required this.stockId,
      required this.tag,
      required this.criteriaList,
      required this.index})
      : super(key: key);

  @override
  State<IndexDetail> createState() => _IndexDetailState();
}

class _IndexDetailState extends State<IndexDetail> {
  List<Criterion>? _criterionList;
  @override
  void initState() {
    super.initState();
    _criterionList = widget.criteriaList;
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
                decoration: const BoxDecoration(color: Colors.lightBlue),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.tag,
                          style: const TextStyle(fontSize: 15, color: Colors.green, fontWeight: FontWeight.bold),
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
                  Criterion c = extractCriteriaText(index);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: Text(
                            c.text.toString(),
                            style: const TextStyle(fontSize: 16),
                          ))
                      // ),
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
