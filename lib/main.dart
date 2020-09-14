import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hackathon',
      theme: ThemeData(
        primaryColor: Colors.grey[300],
        canvasColor: Colors.grey[50],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Dell Business'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var widgets =
        Provider.of<AppModel>(context).getItems().map((item) => _getCard(item));
    var x = AppStructure();
    return x.create(
      context,
      Center(
        child: Column(children: [
          Expanded(
            child: ListView(
              children: widgets.toList(),
            ),
          ),
        ]),
      ),
      true,
    );
  }

  Widget _getCard(ItemModel model) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(model.icon),
            title:
                Text("${model.title} - ${model.price.toStringAsFixed(2)} \$"),
            subtitle: Text(model.description),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('SHOP'),
                onPressed: () {/* ... */},
              ),
              FlatButton(
                child: const Text('FAVORITE'),
                onPressed: () {/* ... */},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyAccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppStructure().create(context, Text('asdsad'), false);
  }
}

class AppStructure {
  Widget create(BuildContext context, Widget child, bool showFab) {
    {
      return Scaffold(
        floatingActionButton: Visibility(
          visible: showFab,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    height: 400,
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: [
                                  SwitchListTile(
                                    value: Provider.of<AppModel>(context,
                                            listen: true)
                                        .showAll,
                                    onChanged: (_) {
                                      Provider.of<AppModel>(context,
                                              listen: false)
                                          .hideSome();
                                    },
                                    title: Text('Show under 100\$'),
                                    secondary: Icon(Icons.ac_unit),
                                  ),
                                  CheckboxListTile(
                                    value: true,
                                    onChanged: null,
                                    title: Text('asdsadsadsada'),
                                    secondary: Icon(Icons.ac_unit),
                                  ),
                                  CheckboxListTile(
                                    value: true,
                                    onChanged: null,
                                    title: Text('dada'),
                                    secondary: Icon(Icons.ac_unit),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                SwitchListTile(
                                  value: true,
                                  onChanged: null,
                                  title: Text('asdsadsadsada'),
                                  secondary: Icon(Icons.ac_unit),
                                ),
                                CheckboxListTile(
                                  value: true,
                                  onChanged: null,
                                  title: Text('asdsadsadsada'),
                                  secondary: Icon(Icons.ac_unit),
                                ),
                                CheckboxListTile(
                                  value: true,
                                  onChanged: null,
                                  title: Text('dada'),
                                  secondary: Icon(Icons.ac_unit),
                                ),
                                SwitchListTile(
                                  value: true,
                                  onChanged: null,
                                  title: Text('asdsadsadsada'),
                                  secondary: Icon(Icons.ac_unit),
                                ),
                                CheckboxListTile(
                                  value: true,
                                  onChanged: null,
                                  title: Text('asdsadsadsada'),
                                  secondary: Icon(Icons.ac_unit),
                                ),
                                CheckboxListTile(
                                  value: true,
                                  onChanged: null,
                                  title: Text('dada'),
                                  secondary: Icon(Icons.ac_unit),
                                ),
                              ],
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RaisedButton(
                                child: const Text('Filter'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.filter_alt),
          ),
        ),
        appBar: AppBar(
          title: Text('Dell Business'),
          actions: [
            IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
            IconButton(icon: Icon(Icons.person), onPressed: () {}),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: InkWell(
                  child: Image(image: AssetImage('./logo.png')),
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Account'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAccountWidget()));
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favorites'),
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text('Wishlist'),
              ),
              ListTile(
                leading: Icon(Icons.list_alt),
                title: Text('History'),
              ),
            ],
          ),
        ),
        body: child,
      );
    }
  }
}

class AppModel extends ChangeNotifier {
  final List<ItemModel> _items = List<ItemModel>();
  final String _loremIpsum = """
  It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose
  """;

  AppModel() {
    var items = _loremIpsum.split(" ");
    var forloop = [1, 2, 3];
    var longLoop = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    var random = Random();
    for (double i = 0; i < 100; i++) {
      _items.add(ItemModel(
        forloop.map((_) {
          return items[random.nextInt(items.length)];
        }).join(" "),
        longLoop.map((_) {
          return items[random.nextInt(items.length)];
        }).join(" "),
        Icons.ac_unit,
        random.nextDouble() * 1500,
      ));
    }
  }

  bool showAll = false;

  List<ItemModel> getItems() {
    if (!showAll)
      return _items;
    else
      return _items.where((element) => element.price < 100.00).toList();
  }

  hideSome() {
    showAll = !showAll;
    notifyListeners();
  }
}

class ItemModel {
  String title;
  String description;
  IconData icon;
  double price;
  ItemModel(this.title, this.description, this.icon, this.price);
}
