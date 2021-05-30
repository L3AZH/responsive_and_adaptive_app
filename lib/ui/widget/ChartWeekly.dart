import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_and_adaptive_app/main.dart';
import 'package:responsive_and_adaptive_app/ui/widget/ItemInChart.dart';

class ChartWeekly extends StatefulWidget{


  @override
  _ChartWeeklyState createState() => _ChartWeeklyState();
}

class _ChartWeeklyState extends State<ChartWeekly>{

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constaint){
      return Container(
        width: constaint.maxWidth,
        height: constaint.maxHeight,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: constaint.maxWidth/8,
                height: constaint.maxHeight,
                child: ItemInChart("S", 70, 100),
              ),
              Container(
                width: constaint.maxWidth/8,
                height: constaint.maxHeight,
                child: ItemInChart("M", 50000000, 100000000),
              ),
              Container(
                width: constaint.maxWidth/8,
                height: constaint.maxHeight,
                child: ItemInChart("S", 70, 100),
              ),
              Container(
                width: constaint.maxWidth/8,
                height: constaint.maxHeight,
                child: ItemInChart("S", 70, 100),
              ),
              Container(
                width: constaint.maxWidth/8,
                height: constaint.maxHeight,
                child: ItemInChart("S", 70, 100),
              ),
              Container(
                width: constaint.maxWidth/8,
                height: constaint.maxHeight,
                child: ItemInChart("S", 70, 100),
              ),
              Container(
                width: constaint.maxWidth/8,
                height: constaint.maxHeight,
                child: ItemInChart("S", 70, 100000000000),
              ),
            ],
          ),
        )
      );
    });
  }
}