import 'package:flutter/material.dart';
import 'package:homework/view/widgets/currency/currency_screen.dart';
import 'package:homework/view/widgets/metals/metals_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/*
  يمان عبد الجبار ابو خليل
*/
class _HomePageState extends State<HomePage> {
  Widget getWidgets(int index) {
    switch (index) {
      case 0:
        return const CurrencyScreen();
      case 1:
        return const MetalScreen();
    }
    return Container();
  }

  int _thisIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        selectedFontSize: 23,
        selectedIconTheme: const IconThemeData(size: 23),
        currentIndex: _thisIndex,
        onTap: (int index) {
          setState(() {
            _thisIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Currency',
            icon: Icon(
              Icons.monetization_on,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Metals',
            icon: Icon(
              Icons.import_export_outlined,
            ),
          ),
        ],
      ),
      body: getWidgets(_thisIndex),
    );
  }
}
