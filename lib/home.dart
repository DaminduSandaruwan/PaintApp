import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:paint_app/myCustomPainter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(138, 35, 135, 1.0),
                  Color.fromRGBO(233, 64, 87, 1.0),
                  Color.fromRGBO(242, 113, 33, 1.0),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width *0.8,
                  height: height *0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onPanDown: (details){
                      this.setState(() {
                        points.add(details.localPosition);
                      });
                    },
                    onPanUpdate:(details){
                      this.setState(() {
                        points.add(details.localPosition);
                      });
                    } ,
                    onPanEnd: (details){
                      this.setState(() {
                        points.add(null);
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0)
                      ),
                      child: CustomPaint(
                        painter: MyCustomPainter(
                          points: points
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: width*0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.color_lens),
                        onPressed: (){

                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.layers_clear),
                        onPressed: (){
                          
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
