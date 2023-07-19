import 'package:flutter/material.dart';
import 'package:travel_app/models/category.dart';
import 'package:travel_app/screens/trip_screen.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final double radius = 20.0;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        TripScreen.screenRoute,
        arguments: {
          'id': category.id,
          'title': category.title,
        },
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
          Positioned(
            child: Center(
                child: Text(
              category.title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 25.0,
                  ),
            )),
          ),
        ],
      ),
    );
  }
}
