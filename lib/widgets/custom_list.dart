import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
   
  final int length;
  final double height;
  final double width;
  final Axis axis;
  final Widget Function(BuildContext, int) itemBuilder;

  const CustomList(
    {
      Key? key, 
      required this.length,
      required this.height,
      required this.width,
      required this.itemBuilder, 
      required this.axis,
    }
  ) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CustomScrollView(
        scrollDirection: axis,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return itemBuilder(context,index);
            },
            childCount: length
            ),
          )
        ],
      ),
    );
  }
}