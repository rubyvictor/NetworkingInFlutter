import 'package:flutter/material.dart';

class BuildLoadingView extends StatelessWidget {
  const BuildLoadingView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Loading...'))
        ],
      ),
    );
  }
}