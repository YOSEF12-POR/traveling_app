import 'package:flutter/material.dart';
import '../widgets/ap_drawer.dart';
import '../screens/categories_screens.dart';
import '../screens/favortites_screen.dart';

class TabsScreen extends StatefulWidget {
  // ااذا بدنا نعمل تاب سفلية بنستخدم ستات فل ويدجت
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    // عشان يعرف شوهي الصفحة الي خترناها
    setState(() {
      _seclectScreenIndex = index;
    });
  }

  int _seclectScreenIndex = 0;

  final List<Map<String, Object>> _secreen = [
    {'Screen': CatogriesScreen(), 'Title': 'تصنيفات الرحلات'},
    {'Screen': FavortitesScreen(), 'Title': 'المفضلة'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_secreen[_seclectScreenIndex]['Title'] as String),
      ),
   drawer:AppDrawer(),
      body: _secreen[_seclectScreenIndex]['Screen']
          as Widget, // بحدد الشاشات الي بدي اختراهم
      bottomNavigationBar: BottomNavigationBar(
        // عشان احط تاب سفليه للتطبيق
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _seclectScreenIndex,
        items: [
          // بضيف ازار الي بدي اتنقل فيهم
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'التصنيفات'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلة'),
        ],
      ),
    );
  }
}
