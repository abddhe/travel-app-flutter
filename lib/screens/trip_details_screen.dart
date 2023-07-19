import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/home_screen.dart';

class TripDetailsScreen extends StatefulWidget {
  static const String screenRoute = "/trip-details";

  const TripDetailsScreen({
    super.key,
  });

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  IconData floatIcon = Icons.star_outline_sharp;


  @override
  Widget build(BuildContext context) {
    final Trip trip = ModalRoute.of(context)?.settings.arguments as Trip;
    if(HomeScreen.favoriteTrips.contains(trip)){
      floatIcon = Icons.star_sharp;
    }
    int index = 0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(trip.title),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(
              child: Image.network(
                trip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "الأنشطة",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: kBackgroundColor,
                          fontSize: 20.0,
                        ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 30,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 200.0,
                    padding: const EdgeInsets.all(15.0),
                    child: ListView(
                      children: [
                        ...trip.activities.map((e) => SizedBox(
                              height: 35.0,
                              child: Text(e),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "البرنامج اليومي",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: kBackgroundColor,
                          fontSize: 20.0,
                        ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 30,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 200.0,
                    padding: const EdgeInsets.all(15.0),
                    child: ListView(
                      children: [
                        ...trip.programs.map((e) {
                          index++;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                width: 60.0,
                                height: 60.0,
                                alignment: Alignment.center,
                                child: Text(
                                  "يوم ${index}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: kBackgroundColor,
                                      ),
                                ),
                              ),
                              title: Text(
                                e,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            if (floatIcon == Icons.star_outline_sharp) {
              floatIcon = Icons.star_sharp;
              HomeScreen.favoriteTrips.add(trip);
            } else {
              floatIcon = Icons.star_outline_sharp;
              HomeScreen.favoriteTrips.removeWhere((el) => el.id == trip.id);
            }
          }),
          child: Icon(
            floatIcon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
