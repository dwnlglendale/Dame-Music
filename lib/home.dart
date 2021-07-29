import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class AlbumCard extends StatelessWidget {
  const AlbumCard({Key? key, required this.image, required this.label}) : super(key: key);

  final ImageProvider image;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
     Image(image: image, width: 100, height: 100,fit: BoxFit.cover,),
      SizedBox(height: 10,),
      Text(label),

    ],);
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
                              SizedBox(width: 10,),
                              AlbumCard(label: "Pain", image: AssetImage("assets/album1.jpg"),),
                              SizedBox(width: 10,),
                              AlbumCard(label: "Cold", image: AssetImage("assets/album2.jpg"),),
                              SizedBox(width: 10,),
                              AlbumCard(label: "Stray Sheep",image: AssetImage("assets/album3.jpg"),),
                              SizedBox(width: 10,),
                              AlbumCard(label: "Syre",image: AssetImage("assets/album4.jpg"),),
                              SizedBox(width: 10,),
                              AlbumCard(label: "Erys",image: AssetImage("assets/album5.jpg"),),
                            ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(children: [

                    Text("Good Evening",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],),
                  SizedBox(height: 10,),

                  Container(
                    decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(4),),
                    clipBehavior: Clip.antiAlias,
                    child: Row(children: [
                      Image(image: AssetImage("assets/album3.jpg"), fit: BoxFit.cover, height: 40, width: 40,),
                      SizedBox(width: 10,),
                      Text("Top 10")
                    ],),
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
