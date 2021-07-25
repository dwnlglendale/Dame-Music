import 'package:dame_music/home.dart';
import 'package:dame_music/library.dart';
import 'package:dame_music/profile.dart';
import 'package:dame_music/search.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {


  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedTab,
        onTap: (index){
          setState(() {
            this._selectedTab = index;
          });
        },

        items: [

        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
        BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "Search",),
        BottomNavigationBarItem(icon: Icon(Icons.library_books_outlined), label: "Library",),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile",),



      ],
      ),

      body: Stack(
        children: [
          renderView(0, HomeView()),
          renderView(1, SearchView()),
          renderView(2, LibraryView()),
          renderView(3, ProfileView()),
        ],
      ),
    );


  }

  Widget renderView(int tabIndex, Widget view){
    return IgnorePointer(
      ignoring: _selectedTab != tabIndex,
      child: Opacity(opacity: _selectedTab == tabIndex ? 1 : 0, child: view,),
    );
  }
}
