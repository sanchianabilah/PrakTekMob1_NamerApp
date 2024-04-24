import 'package:flutter/material.dart';
import 'package:namer_app/providers/app_state.dart';
import 'package:namer_app/screens/favorite_screen.dart';
import 'package:namer_app/screens/random_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: "Favorite",
      ),
    ];

    List<Widget> screens = [
      RandomScreen(pair: pair, appState: appState, icon: icon),
      const FavoriteScreen()
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            title: Text('2100016005',
              style: TextStyle(
                fontFamily: 'Calibri',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
            ),
            floating: true,
            snap: true,
            pinned: true,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 204, 81, 83),
                      Color.fromARGB(255, 238, 136, 35),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: screens[currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
