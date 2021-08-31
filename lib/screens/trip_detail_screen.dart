import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/models/trip.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail'; // تعريف عنوان لصفحة

  Widget buildSectionTitle(BuildContext context, String titleText) {
    // ميثود من نوع ويدجت لتنظيم الكود
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripid = ModalRoute.of(context)!.settings.arguments as String;
    final seclectedTrip = Trips_data.firstWhere((trip) =>
        trip.id == tripid); // اختيار نوع الرحية حسب الرقم ايدي الخاص بها
    return Scaffold(
      appBar: AppBar(
        title: Text('${seclectedTrip.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                seclectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            buildSectionTitle(context, 'الأنشطة'),
            buildListViewContainer(
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(color: Colors.grey),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   height: 200,
              //   padding: EdgeInsets.all(10),
              //   margin: EdgeInsets.symmetric(horizontal: 15),
              ListView.builder(
                itemCount: seclectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(seclectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: seclectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('يوم ${index + 1}'),
                      ),
                      title: Text(seclectedTrip.program[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
