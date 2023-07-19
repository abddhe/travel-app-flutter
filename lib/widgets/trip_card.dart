import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/trip_details_screen.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  final double radius = 20.0;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(TripDetailsScreen.screenRoute, arguments: trip),
        child: Card(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * .7,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(radius),
                          topRight: Radius.circular(radius),
                        ),
                        child: Image.network(
                          trip.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 35.0,
                    right: 30.0,
                    child: Text(
                      trip.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              CupertinoIcons.calendar,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const TextSpan(text: " "),
                          TextSpan(text: "${trip.duration} يوم"),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              CupertinoIcons.sun_min_fill,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const TextSpan(text: " "),
                          TextSpan(text: trip.season),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.family_restroom,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const TextSpan(text: " "),
                          TextSpan(text: trip.tripType),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
