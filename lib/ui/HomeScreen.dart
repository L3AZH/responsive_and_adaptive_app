import 'package:flutter/material.dart';
import 'package:responsive_and_adaptive_app/ui/widget/ChartWeekly.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        width: _size.width,
        height: _size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                width: _size.width,
                height: _size.height*0.3,
                child: ChartWeekly(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orangeAccent,
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
