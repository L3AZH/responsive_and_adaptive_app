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


  final _titleTextFormField = CustomTextFormField(
    hint: "Title",
    icon: Icons.label,
  );

  final _amountTextFormField = CustomTextFormField(
    hint: "Amount",
    icon: Icons.money,
  );

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery
        .of(context)
        .size;
    return Container(
        width: _size.width,
        height: _size.height * 0.8,
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
                child: _titleTextFormField,
                // child: CustomTextFormField(
                //   hint: "title",
                //   icon: Icon(Icons.label),
                // )
                /// Tai sao khong khai bao nhu kieu tren ma phai viet 1 bien
                /// tren class r ms dung o build, co 2 ly do:
                /// - ly do thu nhat:
                /// Khi khao bao bien nhu tren ta co the truy cap bien keyForm
                /// da duoc viet trong lop CustomTextFormField de validation khi
                /// nhan nut trong button => xem lab_manager de hieu them
                /// - ly do thu hai:
                /// Khai bao nhu tren cmt se xay ra loi sau, keyboard xuat hien
                /// r bien mat, text se bi clear khi nhap xong, tai sao ?
                /// vi khi ta dung GlobalKey<FormState> va dung chung vs
                /// StatelessWidget => khi t nhap du lieu vao state thay doi =>
                /// widget se build lai => clear text, khi t khoi t 1 bien roi 
                /// ms dung => GlobalKey<FormState> se khong dc tao moi ms khi
                /// build lai => state thay doi nhung van du nguyen dc du lieu cu
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                width: _size.width * 0.7,
                height: _size.height * 0.5 * 0.2,
                child: _amountTextFormField,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Save"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.purple)
                      ),
                    ),
                  )
                ],
              )
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

  final TextEditingController textEditController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        width: constraint.maxWidth,
        height: constraint.maxHeight,
        child: Form(
          key: formKey,
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
            controller: this.textEditController,
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
