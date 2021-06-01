import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_and_adaptive_app/main.dart';
import 'package:responsive_and_adaptive_app/ui/widget/ItemInChart.dart';
import 'package:responsive_and_adaptive_app/viewmodel/HomeProvider.dart';

class ChartWeekly extends StatefulWidget {
  HomeProvider? _homeProvider;

  ChartWeekly(this._homeProvider);

  @override
  _ChartWeeklyState createState() => _ChartWeeklyState(this._homeProvider);
}

class _ChartWeeklyState extends State<ChartWeekly> {
  HomeProvider? _homeProvider;

  _ChartWeeklyState(this._homeProvider);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constaint) {
      return Container(
          width: constaint.maxWidth,
          height: constaint.maxHeight,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _homeProvider!.listDataChart.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: constaint.maxWidth / 8,
                          height: constaint.maxHeight,
                          child: ItemInChart(
                              _homeProvider!.listDataChart[index]["last_time"]
                                  .toString()[0],
                              double.parse(_homeProvider!.listDataChart[index]
                                      ["total_amount"]
                                  .toString()),
                              1000),
                        );
                      }),
                )
              ],
            ),
          ));
    });
  }
}
