import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
    var x = AppStructure();
    return x.create(
      context,
      Center(
        child: Column(children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
                _getCard(),
              ],
            ),
          ),
        ]),
      ),
      true,
    );
  }

  Widget _getCard() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {/* ... */},
              ),
              FlatButton(
                child: const Text('LISTEN'),
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
