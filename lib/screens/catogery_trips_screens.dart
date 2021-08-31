import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../app_data.dart';
import '../widgets/trip_item.dart';

class CatogerTripsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  static const screenRoute = '/category-trips';
  // const CatogerTripsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryid = routeArgument['id'];
    final categoryTitle = routeArgument['title'];
    final filteredTrips = Trips_data.where((trip) {
      return trip.categories.contains(categoryid);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
              id: filteredTrips[index].id,
              title: filteredTrips[index].title,
              imageUrl: filteredTrips[index].imageUrl,
              duration: filteredTrips[index].duration,
              season: filteredTrips[index].season,
              tripType: filteredTrips[index].tripType);
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
}
