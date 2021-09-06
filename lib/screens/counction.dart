import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/ap_drawer.dart';

class CounctionPage extends StatefulWidget {
  const CounctionPage({Key? key}) : super(key: key);
  static const screenRoute = '/count';

  @override
  _CounctionPageState createState() => _CounctionPageState();
}

class _CounctionPageState extends State<CounctionPage> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تواصل'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    customLaunch(
                        'https://www.facebook.com/profile.php?id=100015466327926');
                  },
                  child: Text('URL'),
                ),
                RaisedButton(
                  onPressed: () {
                    customLaunch(
                        'mailto:y0599735916@gamil.com?subject=feedback%20_app&body=...');
                  },
                  child: Text('Email'),
                ),
                RaisedButton(
                  onPressed: () {
                    customLaunch('tel:0599735916');
                  },
                  child: Text('Phone'),
                ),
                RaisedButton(
                  onPressed: () {
                    customLaunch('sms:0599735916');
                  },
                  child: Text('SMS'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
