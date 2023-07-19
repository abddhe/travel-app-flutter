import 'package:travel_app/models/category.dart';

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String tripType;
  final String season;
  final String imageUrl;
  final int duration;
  final List<String> activities;
  final List<String> programs;
  final bool isInSummer;
  final bool isForFamilies;
  final bool isInWinter;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.tripType,
    required this.season,
    required this.imageUrl,
    required this.duration,
    required this.activities,
    required this.programs,
    this.isInSummer = true,
    this.isForFamilies = false,
    this.isInWinter = false,
  });
}

class TripType{
  static const String Activities = "أنشطة";
  static const String Exploration = "استطلاع";
  static const String Recovery = "نقاء";
}

class Season{
  static const String Winter = "شتاء";
  static const String Summer = "صيف";
  static const String Spring = "ربيع";

}
