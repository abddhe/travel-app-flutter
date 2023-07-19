import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String screenRoute = "/filter";
  static Map<String, bool> filters = {
    "isSummer": false,
    "isWinter": false,
    "isFamilies": false,
  };

  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isSummer = FilterScreen.filters['isSummer']!;
  bool _isFamilies = FilterScreen.filters['isFamilies']!;
  bool _isWinter = FilterScreen.filters['isWinter']!;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget buildSwitchListTile(String title, String subtitle, bool value,
      void Function(bool newValue) callback) {
    return SwitchListTile(
        value: value,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: callback);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("الفلترة"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => setState(() {
                FilterScreen.filters = {
                  "isSummer": _isSummer,
                  "isWinter": _isWinter,
                  "isFamilies": _isFamilies,
                };
              }),
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: ListView(
          children: [
            buildSwitchListTile("رحلات الصيفية",
                "إظهار فقط الرحلات التى في الصيف فقط", _isSummer, (newValue) {
              setState(() {
                _isSummer = newValue;
              });
            }),
            buildSwitchListTile("رحلات الشتوية",
                "إظهار فقط الرحلات التى في الشتاء فقط", _isWinter, (newValue) {
              setState(() {
                _isWinter = newValue;
              });
            }),
            buildSwitchListTile("رحلات العائلية",
                "إظهار فقط الرحلات التى للعائلات فقط", _isFamilies, (newValue) {
              setState(() {
                _isFamilies = newValue;
              });
            }),
          ],
        ),
      ),
    );
  }
}
