import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_and_adaptive_app/ui/widget/DatePickElevateButton.dart';

class AddTransactionModalBottomSheet extends StatefulWidget {
  @override
  _AddTransactionModalBottomSheet createState() =>
      _AddTransactionModalBottomSheet();
}

class _AddTransactionModalBottomSheet
    extends State<AddTransactionModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
        width: _size.width,
        height: _size.height * 0.5,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                width: _size.width * 0.7,
                height: _size.height * 0.5 * 0.2,
                child: CustomTextFormField(
                  hint: "Title",
                  icon: Icons.perm_camera_mic,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                width: _size.width * 0.7,
                height: _size.height * 0.5 * 0.2,
                child: CustomTextFormField(
                  hint: "Amount",
                  icon: Icons.perm_camera_mic,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.date_range,
                  color: Colors.purple,
                ),
                title: Row(
                  children: [
                    DatePickElevateBtn(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomTextFormField extends StatelessWidget {
  String? _hint;
  IconData? _iconData;

  CustomTextFormField({String? hint, IconData? icon}) {
    this._hint = hint;
    this._iconData = icon;
  }

  final textEditController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        width: constraint.maxWidth,
        height: constraint.maxHeight,
        child: Form(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: this._hint,
              labelStyle: TextStyle(color: Colors.pink.withOpacity(0.5)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.purple.withOpacity(0.5))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2)),
              prefixIcon: Icon(
                _iconData,
                color: Colors.purple,
              ),
            ),
            style: TextStyle(color: Colors.purple),
            controller: textEditController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please full fill information";
              }
              return null;
            },
          ),
        ),
      );
    });
  }
}
