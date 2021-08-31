import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/categories_screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/catogery_trips_screens.dart';
import 'screens/trip_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //fsdfsdfsdf

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // English, no country code
      ],
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: CatogriesScreen(),

      initialRoute: '/',

      routes: {
        '/': (ctx) => TabsScreen(),
        CatogerTripsScreen.screenRoute: (ctx) => CatogerTripsScreen(),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(),
        filtersScreen.screenRoute: (ctx) => filtersScreen(),
      },
    );
  }
}
