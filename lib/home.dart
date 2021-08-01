import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'song_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class AlbumCard extends StatelessWidget {
  const AlbumCard({Key? key, required this.image, required this.label})
      : super(key: key);

  final ImageProvider image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
          image: image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10,
        ),
        Text(label),
      ],
    );
  }
}

class RowAlbum extends StatelessWidget {
  const RowAlbum({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  final ImageProvider image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(9),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 100,
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Colors.yellow.withOpacity(0.2),
                  Colors.yellow.withOpacity(0)
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Releases",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.history),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.settings),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(8),
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            AlbumCard(
                              label: "Pain",
                              image: AssetImage("assets/album1.jpg"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AlbumCard(
                              label: "Cold",
                              image: AssetImage("assets/album2.jpg"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AlbumCard(
                              label: "Stray Sheep",
                              image: AssetImage("assets/album3.jpg"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AlbumCard(
                              label: "Syre",
                              image: AssetImage("assets/album4.jpg"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AlbumCard(
                              label: "Erys",
                              image: AssetImage("assets/album5.jpg"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      children: [
                        Text(
                          "Good Evening",
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     RowAlbum(
                  //       image: AssetImage("assets/favourites.jpg"),
                  //       label: "FAVOURITES",
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     RowAlbum(
                  //       image: AssetImage("assets/logo-top.png"),
                  //       label: "TOP 50",
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   children: [
                  //     RowAlbum(
                  //       image: AssetImage("assets/annemarie.jpg"),
                  //       label: "THERAPY",
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     RowAlbum(
                  //       image: AssetImage("assets/ksi.jpg"),
                  //       label: "ALL OVER",
                  //     ),
                  //   ],
                  // ),
                  //Dead Code
                  Container(
                    height: 150,
                    child: GridView(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisExtent: 60,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      children: [
                        RowAlbum(
                          image: AssetImage("assets/favourites.jpg"),
                          label: "FAVOURITES",
                        ),
                        RowAlbum(
                          image: AssetImage("assets/logo-top.png"),
                          label: "TOP 50",
                        ),
                        RowAlbum(
                          image: AssetImage("assets/annemarie.jpg"),
                          label: "THERAPY",
                        ),
                        RowAlbum(
                          image: AssetImage("assets/ksi.jpg"),
                          label: "ALL OVER",
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      children: [
                        Text(
                          "Based on your recent listening",
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        Recently(
                          image: AssetImage("assets/album2.jpg"),
                          label: "Astroworld",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Recently(
                            image: AssetImage("assets/album6.jpg"),
                            label: "Central Cee"),
                        SizedBox(
                          width: 10,
                        ),
                        Recently(
                            image: AssetImage("assets/album7.jpg"),
                            label: "Commitment"),
                        SizedBox(
                          width: 10,
                        ),
                        Recently(
                            image: AssetImage("assets/album8.jpg"),
                            label: "Cee 99"),
                        SizedBox(
                          width: 10,
                        ),
                        Recently(
                            image: AssetImage("assets/album9.jpg"),
                            label: "Psychodrama"),
                        SizedBox(
                          width: 10,
                        ),
                        Recently(
                            image: AssetImage("assets/album10.jpg"),
                            label: "Dave"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
