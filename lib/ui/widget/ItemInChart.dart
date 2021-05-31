import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemInChart extends StatelessWidget{

  String? day;
  double? spendAmount;
  double? totalAmount;
  ItemInChart(this.day,this.spendAmount,this.totalAmount);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraint){
      return Container(
        width: constraint.maxWidth,
        height: constraint.maxHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              width: constraint.maxWidth*0.8,
              height: constraint.maxHeight*0.1,
              child: Text("$totalAmount",overflow: TextOverflow.ellipsis,maxLines: 1,),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: (constraint.maxWidth)*0.4,
                  height: constraint.maxHeight*0.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                Container(
                  width: (constraint.maxWidth)*0.4,
                  height: (constraint.maxHeight*0.5)*(spendAmount!/totalAmount!),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: constraint.maxWidth,
              height: constraint.maxHeight*0.1,
              child: Text(day!,overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),
      );
    });
  }
}