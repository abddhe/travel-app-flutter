import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/screens/filter_screen.dart';
import 'package:travel_app/screens/home_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget buildDrawerItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: 35.0,
          color: kBackgroundColor,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 22.0,
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.secondary,
            height: 100.0,
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              "دليلك السياحي",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 25.0,
                  ),
            ),
          ),
          buildDrawerItem(
            context,
            Icons.home,
            "الرئيسية",
            () {
              Navigator.of(context).pushNamed(HomeScreen.screenRoute);
            },
          ),
          buildDrawerItem(
            context,
            Icons.filter_alt,
            "الفلترة",
                () {
              Navigator.of(context).pushNamed(FilterScreen.screenRoute);
            },
          ),
        ],
      ),
    );
  }
}
