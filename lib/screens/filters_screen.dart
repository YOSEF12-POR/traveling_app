import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/ap_drawer.dart';

class filtersScreen extends StatefulWidget {
  const filtersScreen({Key? key}) : super(key: key);

  static const screenRoute = '/filters';

  @override
  _filtersScreenState createState() => _filtersScreenState();
}

class _filtersScreenState extends State<filtersScreen> {
  Widget buildSwitchTile(
      String title, String subtitle, var currntValue, updatevalue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currntValue,
        onChanged: updatevalue);
  }

  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamilies = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                buildSwitchTile(
                  'الرحلات الصيفية',
                  'إظهار الرحلات في فصل صيف',
                  _isInSummer,
                  (newValue) {
                    setState(() {
                      _isInSummer = newValue;
                    });
                  },
                ),
                buildSwitchTile(
                  'الرحلات الشتوية',
                  'إظهار الرحلات في فصل الشتاء',
                  _isInWinter,
                  (newValue) {
                    setState(() {
                      _isInWinter = newValue;
                    });
                  },
                ),
                buildSwitchTile(
                  'الرحلات العائلية',
                  ' إظهار الرحلات الخاصة بلعائلات ',
                  _isForFamilies,
                  (newValue) {
                    setState(() {
                      _isForFamilies = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
