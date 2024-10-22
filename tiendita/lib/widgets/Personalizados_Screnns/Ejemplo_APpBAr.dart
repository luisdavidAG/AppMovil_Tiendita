import 'package:flutter/material.dart';
import 'package:tiendita/widgets/AppBar_Personalizado/CustomAppBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(
                expandedHeight: 200,
                appBar: CustomAppBar(expandedHeight: 200),
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text('Item #$index'),
                ),
                childCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final CustomAppBar appBar;

  CustomSliverAppBarDelegate({
    required this.expandedHeight,
    required this.appBar,
  });

  @override
  double get minExtent => 90;

  @override
  double get maxExtent => expandedHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double proportion = (expandedHeight - shrinkOffset) / expandedHeight;
    double minFontSize = 30;
    double maxFontSize = 50.0;
    double fontSize = maxFontSize * proportion;
    fontSize = fontSize.clamp(minFontSize, maxFontSize);

    double opacity = proportion.clamp(0.0, 8.0);
    // Cambiamos el color de fondo dinámicamente
    Color backgroundColor = Color.lerp(const Color.fromARGB(255, 255, 97, 39), Colors.blue, 1 - opacity)!;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Row(
        children: [
          Container(
            height: expandedHeight,
            width: MediaQuery.of(context).size.width * .30,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 8),
                child: CircleAvatar(
                  maxRadius: 60.0,
                  minRadius: minFontSize,
                  backgroundColor: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            height: expandedHeight,
            width: MediaQuery.of(context).size.width * .50,
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              'Hola Usuario',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: AutofillHints.creditCardSecurityCode,
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(CustomSliverAppBarDelegate oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight || appBar != oldDelegate.appBar;
  }
}
