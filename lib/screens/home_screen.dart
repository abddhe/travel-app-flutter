import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/app_drawer.dart';
import 'package:travel_app/widgets/category_card.dart';
import 'package:travel_app/widgets/trip_card.dart';

class HomeScreen extends StatefulWidget {
  static const String screenRoute = '/';
  static Set<Trip> favoriteTrips ={};
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;

@override
  void initState() {
    HomeScreen.favoriteTrips = HomeScreen.favoriteTrips;
    print('1');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    const List<Tab> tabsList = [
      Tab(
        icon: Icon(Icons.category),
        text: "التصنيفات",
      ),
      Tab(
        icon: Icon(Icons.star),
        text: "المفضلة",
      ),
    ];

    return SafeArea(
      child: DefaultTabController(
        length: tabsList.length,
        // Change the length to match the number of tabs
        initialIndex: currentTabIndex,
        child: Scaffold(
          appBar: AppBar(
            title: Text("${tabsList[currentTabIndex].text}"),
            centerTitle: true,
          ),
          bottomSheet: TabBar(
            onTap: (index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            labelColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelColor: Theme.of(context).colorScheme.primary,
            tabs: tabsList,
          ),
          drawer: const AppDrawer(),
          body: TabBarView(
            children: [
              // ... Your content for the first tab ...
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(10.0),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      children: [
                        ...categoriesData.map(
                          (e) => CategoryCard(
                            category: e,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView(
                  children: [
                    ...HomeScreen.favoriteTrips.map(
                          (e) => TripCard(trip: e),
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
