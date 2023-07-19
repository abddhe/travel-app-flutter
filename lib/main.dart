import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/screens/filter_screen.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/trip_details_screen.dart';
import 'package:travel_app/screens/trip_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),
        scaffoldBackgroundColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: kSecondaryColor,
          primary: kPrimaryColor,
        ),
        iconTheme: const IconThemeData(
          color: kIconColor,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: kBackgroundColor,
        ),
        fontFamily: GoogleFonts.alexandria().fontFamily,
        textTheme: GoogleFonts.alexandriaTextTheme(),
        drawerTheme: const DrawerThemeData(backgroundColor: kPrimaryColor),
      ),
      // home: const HomeScreen(),
      initialRoute: HomeScreen.screenRoute,
      routes: {
        HomeScreen.screenRoute: (_) => const HomeScreen(),
        TripScreen.screenRoute: (_) => const TripScreen(),
        TripDetailsScreen.screenRoute: (_) => const TripDetailsScreen(),
        FilterScreen.screenRoute: (_) => const FilterScreen(),
      },
    );
  }
}
