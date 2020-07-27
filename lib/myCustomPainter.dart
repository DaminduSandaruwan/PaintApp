import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter{

  List<Offset> points;

  MyCustomPainter({this.points});

  @override
  void paint(Canvas canvas, Size size) {
      Paint background = Paint()..color = Colors.white;
      Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
      canvas.drawRect(rect, background);

      Paint paint = Paint();
      paint.color = Colors.black;
      paint.strokeWidth = 2.0;
      paint.isAntiAlias =true;
      paint.strokeCap=StrokeCap.round;

      for(int x = 0; x<points.length-1; x++){
        if(points[x] != null && points[x+1] !=null){
          canvas.drawLine(points[x], points[x+1], paint);
        }
        else if(points[x] != null && points[x+1] == null){
          canvas.drawPoints(PointMode.points, [points[x]], paint);
        }
      }

    }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
  

}