import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paint_app/home.dart';

class MyCustomPainter extends CustomPainter{

  List<DrawingArea> points;
  Color color;
  double strokeWidth;

  MyCustomPainter({this.points, this.color, this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
      Paint background = Paint()..color = Colors.white;
      Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
      canvas.drawRect(rect, background);

      // Paint paint = Paint();
      // paint.color = color;
      // paint.strokeWidth = strokeWidth;
      // paint.isAntiAlias =true;
      // paint.strokeCap=StrokeCap.round;

      for(int x = 0; x<points.length-1; x++){
        if(points[x] != null && points[x+1] !=null){
          Paint paint = points[x].areaPaint;
          canvas.drawLine(points[x].point, points[x+1].point, paint);
        }
        else if(points[x] != null && points[x+1] == null){
          Paint paint = points[x].areaPaint;
          canvas.drawPoints(PointMode.points, [points[x].point], paint);
        }
      }

    }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  

}