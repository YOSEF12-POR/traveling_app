import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/ap_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';
  final Function saveFilters;
  // final Map<String, bool> currentFilters;

  FiltersScreen( this.saveFilters);
//this.currentFilters,
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  // @override
  // initState() {
  //   _summer = widget.currentFilters![''];
  //   _winter = widget.currentFilters[''];
  //   _family = widget.currentFilters[''];
  //   super.initState();
  // }

  Widget buildSwitchTile(
      String title, String subtitle, var currntValue, updatevalue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currntValue,
        onChanged: updatevalue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
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
                  _summer,
                  (newValue) {
                    setState(() {
                      _summer = newValue;
                    });
                  },
                ),
                buildSwitchTile(
                  'الرحلات الشتوية',
                  'إظهار الرحلات في فصل الشتاء',
                  _winter,
                  (newValue) {
                    setState(() {
                      _winter = newValue;
                    });
                  },
                ),
                buildSwitchTile(
                  'الرحلات العائلية',
                  ' إظهار الرحلات الخاصة بلعائلات ',
                  _family,
                  (newValue) {
                    setState(() {
                      _family = newValue;
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
