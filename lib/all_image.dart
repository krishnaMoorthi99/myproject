
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:failcode/pictures.dart';
import 'package:flutter/material.dart';
import 'package:project/pictures.dart';

class Home extends StatefulWidget {
  final List<Wallpaper> wallpapersList;

  const Home({Key? key, required this.wallpapersList}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final categories = List<String>.empty(growable: true);
  final categoryImages = List<String>.empty(growable: true);

  @override
  void initState() {
    super.initState();

    widget.wallpapersList.forEach(
          (wallpaper) {
        var category = wallpaper.title;

        if (!categories.contains(category)) {
          categories.add(category);
          categoryImages.add(wallpaper.url);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return InkResponse(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(categoryImages.elementAt(index),
                ),
              ),
            ),
            // alignment:Alignment.center,
            child: Container(
              width: 200,
              child: Center(
                child: Text(
                  categories.elementAt(index).toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'PermanentMarker-Regular',
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}