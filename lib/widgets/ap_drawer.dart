import 'package:flutter/material.dart';
import 'package:traveling_app/screens/counction.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, link) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.blue),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'ElMessiri', fontSize: 40, fontWeight: FontWeight.bold),
      ),
      onTap: link,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              'دليل السياحي ',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('الرحلات', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('التصفية', Icons.filter_list, () {
            Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.screenRoute);
          }),
          buildListTile('تواصل', Icons.email, () {
            Navigator.of(context)
                .pushReplacementNamed(CounctionPage.screenRoute);
          }),
        ],
      ),
    );
  }
}
