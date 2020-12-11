import 'package:flutter/material.dart';
import 'package:wac_coaching/server.dart';

class SocialAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Authentication'),
      ),
      body: Center(child: RaisedButton(
        onPressed: () {
          signInWithFacebook();
        },
      )),
    );
  }
}
