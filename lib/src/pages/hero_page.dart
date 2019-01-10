import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HeroHeader implements SliverPersistentHeaderDelegate {
  HeroHeader({
    this.minExtent,
    this.maxExtent,
  });
  double maxExtent;
  double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(fit: BoxFit.cover, image: NetworkImage("https://cbsmiami.files.wordpress.com/2017/07/swissalps.jpg?w=625")),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 4.0,
          top: 4.0,
          child: SafeArea(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            'Hero Image',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class HeroPage extends StatelessWidget {
  final List<String> assetNames = [
    'https://us.123rf.com/450wm/photohomepage/photohomepage1711/photohomepage171100218/90056493-mountain-stream-faltenbachtobel-in-bavaria-germany-in-portrait-format.jpg?ver=6',
    'https://c1.staticflickr.com/2/1584/26413306660_626c3d4e21_b.jpg',
    'https://i.pinimg.com/736x/37/ca/f4/37caf44665f1fabb1fcab3928c41c177--appalachian-mountains-appalachian-trail-pictures.jpg',
    'https://i.pinimg.com/736x/24/3f/42/243f4249c569f5da4181959d6e5d6b75.jpg',
    'https://static1.squarespace.com/static/55977355e4b0386248d271f7/56f7ba5fab48de2c7c19fd25/57b15ee99de4bb3199d46157/1491051295693/?format=500w',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeFJ-shViotjI_1REVMjf3usT-oKKmZvJxMS5Vdr5bSpXnAQrhcA',
    'https://static1.squarespace.com/static/51f6b8bfe4b0135c34aa5945/5abd04736d2a737610075743/5abd081003ce6475165c2c30/1522895483219/IMG_5632.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvZjbTDwwQpuApnq3tvWDEIWoBbO04R20zQBTRYoglgEp42uPT',
  ];

  EdgeInsets _edgeInsetsForIndex(int index) {
    if (index % 2 == 0) {
      return EdgeInsets.only(top: 4.0, left: 8.0, right: 4.0, bottom: 4.0);
    } else {
      return EdgeInsets.only(top: 4.0, left: 4.0, right: 8.0, bottom: 4.0);
    }
  }

  Widget _buildContent() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: HeroHeader(
            minExtent: 150.0,
            maxExtent: 250.0,
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 0.75,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                padding: _edgeInsetsForIndex(index),
                child: Image(fit: BoxFit.cover, image: NetworkImage(assetNames[index % assetNames.length])),
              );
            },
            childCount: assetNames.length * 2,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Color.fromRGBO(230, 230, 230, 1), child: _buildContent()),
    );
  }
}
