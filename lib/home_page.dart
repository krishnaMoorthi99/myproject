import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:failcode/pictures.dart';
//import 'package:failcode/upload.dart';
import 'package:flutter/material.dart';
import 'package:project/pictures.dart';
import 'package:project/upload.dart';

import 'all_image.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = PageController(initialPage: 1);
  int currentSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
        }, icon: Icon(Icons.add))],
        title: Text(''),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('wallpapers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            var wallpapersList = List<Wallpaper>.empty(growable: true);

            snapshot.data?.docs.forEach((documentSnapshot) {
              var wallpaper = Wallpaper.fromDocumentSnapshot(documentSnapshot);
              wallpapersList.add(wallpaper);
            });

            return PageView.builder(
              controller: pageController,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return _getPagesAtIndex(index, wallpapersList);
              },
              onPageChanged: (int index) {
                setState(() {
                  currentSelected = index;
                });
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }


  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting, // Shifting
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(
          fontFamily: 'VujahdayScript-Regular'
      ),
      currentIndex: currentSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'All Images',
          backgroundColor: Colors.indigo,),
        BottomNavigationBarItem(
          icon: Icon(Icons.upload),
          label: 'Upload',
          backgroundColor: Colors.lightGreen,),
      ],
      onTap: (int index) {
        setState(() {
          currentSelected = index;
        });
      },
    );
  }

  Widget _getPagesAtIndex(int index, List<Wallpaper> wallpaperList) {
    switch (index) {
      case 0:
        return Home(
          wallpapersList: wallpaperList,
        );
      case 1:
        return MyHomePage();
      default:
        return const CircularProgressIndicator();
    }
  }
}