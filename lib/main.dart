import 'package:app_locate_bike/Screens/bike_details_screen.dart';
import 'package:app_locate_bike/Screens/bikes_overview_screen.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BikeOverviewScreen(),
      routes: {
        AppRoutes.BIKE_DETAIL: (context) => BikeDetailsScreen(),
      }
    );
  }
}

