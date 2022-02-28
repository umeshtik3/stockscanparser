import 'package:flutter/material.dart';
import 'package:stockscanparser/data_models/data_models.dart';
import 'package:stockscanparser/utility/common/common_style.dart';

class ListParameters extends StatelessWidget {
  final Dollors? dollors;
  const ListParameters({Key? key, required this.dollors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('list parameter'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: dollors!.values!.length,
                  itemBuilder: (context, index) {
                    dollors!.values!.sort();
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: Style.padding10),
                      decoration:
                          const BoxDecoration(border: Border(bottom: BorderSide(color: Style.dailyWhite, width: 1.0))),
                      child: Text(
                        dollors!.values![index].toString(),
                        style: Style.text20(context),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
