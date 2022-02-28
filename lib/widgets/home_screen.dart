import 'package:flutter/material.dart';

import '../backend/api/api_manager.dart';
import '../data_models/data_models.dart';
import '../utility/common/common_style.dart';
import 'index_details.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  List<Indexes>? _stockIndexList;
  @override
  void initState() {
    super.initState();
    getIndexesData();
  }

  void getIndexesData() async {
    ApiManager _apiManager = ApiManager();
    _stockIndexList = await _apiManager.fetchData();

    if (_stockIndexList?.length != null) {
      setState(() {
        _loading = false;
      });
    }
  }

  Indexes _singleIndex(int index, List<Indexes>? list) {
    Indexes _indexes = Indexes();
    _indexes.color = list![index].color;
    _indexes.name = list[index].name;
    _indexes.tag = list[index].tag;
    _indexes.criteria = list[index].criteria;
    _indexes.id = list[index].id;

    return _indexes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan parser'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _stockIndexList!.length,
                  itemBuilder: (context, index) {
                    Indexes stockIndex = _singleIndex(index, _stockIndexList);
                    return GestureDetector(
                      onTap: (() => {_launchNextPage(context, stockIndex)}),
                      child: Padding(
                        padding: const EdgeInsets.all(Style.padding8),
                        child: Card(
                          color: Style.lightGrey,
                          child: ListTile(
                            title: Text(stockIndex.name!, style: Style.text18(context)),
                            subtitle: Text(
                              stockIndex.tag.toString(),
                              style: TextStyle(fontSize: Style.fontSize16, color: Style.indexColor(stockIndex.color!)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }

  void _launchNextPage(BuildContext context, Indexes stockIndex) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => IndexDetail(
                  stockIndex: stockIndex,
                )));
  }
}
