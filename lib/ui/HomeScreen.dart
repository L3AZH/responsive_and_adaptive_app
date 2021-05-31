import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_and_adaptive_app/ui/widget/ChartWeekly.dart';
import 'package:responsive_and_adaptive_app/ui/widget/TransactionItem.dart';
import 'package:responsive_and_adaptive_app/viewmodel/HomeProvider.dart';

import 'widget/AddTransactionModalBottomSheet.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final homeProvider = Provider.of<HomeProvider>(context);
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
                height: _size.height * 0.3,
                child: ChartWeekly(),
              ),
              Column(
                children: [
                  Container(
                    width: _size.width,
                    height: _size.height * 0.5,
                    child: ListView.builder(
                        itemCount: homeProvider.listTrans.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TransactionItem(
                            tranIndex: homeProvider.listTrans.elementAt(index),
                            onIconButtonCLick: () {
                              homeProvider.deleteTrans(
                                  homeProvider.listTrans.elementAt(index));
                            },
                          );
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return AddTransactionModalBottomSheet();
              });
        },
        backgroundColor: Colors.orangeAccent,
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
