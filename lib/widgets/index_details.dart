import 'package:flutter/material.dart';
import 'package:stockscanparser/data_models/data_models.dart';
import 'package:stockscanparser/widgets/criteria_variables.dart';

class IndexDetail extends StatefulWidget {
  final String title;
  final String tag;
  final int? stockId;
  final List<Criterion>? criteriaList;
  final int index;
  const IndexDetail(
      {Key? key,
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
  Variable? _variable;
  @override
  void initState() {
    super.initState();
    _criterionList = widget.criteriaList;
  }

  Criterion extractCriteriaText(int index) {
    Criterion criterion = Criterion();
    criterion.text = _criterionList![index].text;
    criterion.type = _criterionList![index].type;
    _variable = _criterionList![index].variable;

    // if (_variable != null) {
    //   selectText(_variable);
    // }
    return criterion;
  }

  void selectVariable(int stockId) {
    switch (stockId) {
      case 3:
        {
          CriteriaVariables(
            variable: _variable?.the1,
          );
        }

        break;
      case 4:
        {
          CriteriaVariables(
            variable: _variable?.the2,
          );
        }
        break;
      case 5:
        {
          CriteriaVariables(
            variable: _variable?.the1,
          );
        }

        break;
      default:
    }
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
                padding: EdgeInsets.all(10),
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
                      // RichText(
                      //     text: TextSpan(style: TextStyle(color: Colors.black), children: [
                      //   TextSpan(text: c.text!.split('\$')[0].toString()),
                      //   TextSpan(text: c.text!.split('\$')[1].toString(), style: const TextStyle(color: Colors.blue))
                      // ])),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: !c.text.toString().contains('\$')
                            ? Text(
                                c.text.toString(),
                                style: const TextStyle(fontSize: 16),
                              )
                            : GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CriteriaVariables(
                                                variable: _variable,
                                              )))
                                },
                                child: Text(c.text.toString()),
                              ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
