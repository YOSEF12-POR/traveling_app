import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/ap_drawer.dart';
import '../screens/categories_screens.dart';
import '../screens/favortites_screen.dart';

class TabsScreen extends StatefulWidget {
  // ااذا بدنا نعمل تاب سفلية بنستخدم ستات فل ويدجت
  final List<Trip> favoriteTrips;
  TabsScreen(this.favoriteTrips);
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

    late List<Map<String, Object>> _screens;

    
  @override
  void initState() {
    _screens = [
      {
        'Screen': CategoriesScreen(),
        'Title': 'تصنيفات الرحلات',
      },
      {
        'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': 'الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_seclectScreenIndex]['Title'] as String),
      ),
   drawer:AppDrawer(),
      body: _screens[_seclectScreenIndex]['Screen']
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
