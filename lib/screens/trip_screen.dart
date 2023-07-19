import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/category.dart';
import 'package:travel_app/screens/filter_screen.dart';

import '../models/trip.dart';
import '../widgets/trip_card.dart';

class TripScreen extends StatelessWidget {
  static const String screenRoute = '/trips';

  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryId = routeArguments['id'];
    final String? categoryTitle = routeArguments['title'];
    List<Trip> trips = tripsData
        .where((trip) => trip.categories.contains("$categoryId"))
        .toList();
    Set<Trip> filteredTrips = {};

    if ((FilterScreen.filters['isSummer'] == false &&
            FilterScreen.filters['isSummer'] == false &&
            FilterScreen.filters['isFamilies'] == false) ||
        (FilterScreen.filters['isSummer'] == true &&
            FilterScreen.filters['isSummer'] == true &&
            FilterScreen.filters['isFamilies'] == true)) {
      filteredTrips.addAll(trips);
    } else {
      if (FilterScreen.filters['isSummer'] == true) {
        filteredTrips.addAll(trips.where((trip) => trip.isInSummer));
      }
      if (FilterScreen.filters['isWinter'] == true) {
        filteredTrips.addAll(trips.where((trip) => trip.isInWinter));
      }
      if (FilterScreen.filters['isFamilies'] == true) {
        filteredTrips.addAll(trips.where((trip) => trip.isForFamilies));
      }
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("$categoryTitle"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView(
            children: [
              ...filteredTrips.map(
                (e) => TripCard(trip: e),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
