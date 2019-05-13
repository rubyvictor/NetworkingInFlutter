import 'loading_screen.dart';
import 'create_user_row.dart' as row;
import 'networkingService.dart' as network;
import 'package:flutter/material.dart';
import 'User.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Users'),
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

  initState() {
    super.initState();
    this._getUsers();
  }

  Future<List<User>> _getUsers() async {
    const endpoint = 'https://jsonplaceholder.typicode.com/users';
    return await network.networkingService(endpoint);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: FutureBuilder(
                future: _getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return row.createUserRow(snapshot.data[index]);
                      },
                    );
                  } else {
                    return new BuildLoadingView();
                  }
                })));
  }

  
}



/*
body: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.account_circle, color: Colors.purpleAccent),
                title: Text(_users[index].name, style: TextStyle(fontSize: 24)),
                trailing: Icon(Icons.chevron_right),
              );
            }));
*/
