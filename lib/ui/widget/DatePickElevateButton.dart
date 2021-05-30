import 'package:flutter/material.dart';

class DatePickElevateBtn extends StatefulWidget {
  @override
  _DatePickElevateBtnState createState() => _DatePickElevateBtnState();
}

class _DatePickElevateBtnState extends State<DatePickElevateBtn> {
  String _text = "Select Date";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        child: ElevatedButton(
          child: Text(
            this._text,
            style: TextStyle(color: Colors.purple),
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(color: Colors.purple))),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          onPressed: () => pickDate(context),
        ),
      );
    });
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(initialDate.year - 5),
        lastDate: DateTime(initialDate.year + 5));
    if (newDate == null)
      return;
    else {
      setState(() {
        this._text = "${newDate.day}/${newDate.month}/${newDate.year}";
      });
    }
  }
}
