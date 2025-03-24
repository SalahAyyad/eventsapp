import 'package:ecom/features/home/tabs/favorite_tab.dart';
import 'package:ecom/features/home/tabs/home_tab.dart';
import 'package:ecom/features/home/tabs/map_tab.dart';
import 'package:ecom/features/home/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selecteddIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      HomeTab(),
      MapTab(),
      FavoriteTab(),
      ProfileTab(),
    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/add_event');
        },
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add),
      ),
      body: tabs[selecteddIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selecteddIndex,
          onTap: (index) {
            setState(() {
              selecteddIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: AppLocalizations.of(context)!.home),
            BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: AppLocalizations.of(context)!.map),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: AppLocalizations.of(context)!.favorite),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: AppLocalizations.of(context)!.profile)
          ]),
    );
  }
}
