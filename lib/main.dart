import 'package:flutter/material.dart';
import 'package:stockscanparser/backend/api/api_manager.dart';
import 'package:stockscanparser/data_models/data_models.dart';
import 'package:stockscanparser/widgets/index_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan Parser',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Parser',
      ),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = true;
  List<Indexes>? stockIndexList;
  @override
  void initState() {
    super.initState();
    getIndexesData();
  }

  void getIndexesData() async {
    ApiManager apiManager = ApiManager();
    var indexes = await apiManager.fetchData();
    stockIndexList = indexes;
    if (stockIndexList?.length != null) {
      setState(() {
        loading = false;
      });
    }
  }

  Indexes singleIndex(int index, List<Indexes>? list) {
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
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: stockIndexList!.length,
                  itemBuilder: (context, index) {
                    Indexes stockIndex = singleIndex(index, stockIndexList);
                    return GestureDetector(
                      onTap: (() => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IndexDetail(
                                          title: stockIndex.name.toString(),
                                          tag: stockIndex.tag.toString(),
                                          criteriaList: stockIndex.criteria,
                                          index: index,
                                          stockId: stockIndex.id,
                                        )))
                          }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.grey[300],
                          child: ListTile(
                            title: Text(
                              stockIndex.name.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(
                              stockIndex.tag.toString(),
                              style: TextStyle(
                                  fontSize: 16, color: stockIndex.color == 'green' ? Colors.green : Colors.red),
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
}
