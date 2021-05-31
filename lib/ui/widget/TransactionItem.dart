import 'package:flutter/material.dart';
import 'package:responsive_and_adaptive_app/db/model/Transaction.dart';

class TransactionItem extends StatelessWidget {
  TransactionInfo? tranIndex;
  Function? onIconButtonCLick;

  TransactionItem({this.tranIndex,this.onIconButtonCLick});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.purple,
          child: Container(
            width: 50,
            child: Text(
              "\$${tranIndex!.amount}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          )
        ),
        title: Text(
          tranIndex!.description!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text("${tranIndex!.timeStamp}"),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          // onPressed: onIconButtonCLick!(), de v thi list se bi xoa het ngay tu luc khoi tao
          onPressed: () => onIconButtonCLick!(),
        ),
      ),
    ));
  }
}
