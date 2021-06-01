import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:responsive_and_adaptive_app/db/model/Transaction.dart';
import 'package:responsive_and_adaptive_app/repository/Repository.dart';

class HomeProvider with ChangeNotifier {

  final _repository = Repository();
  List<TransactionInfo> listTrans = [];
  List<Map<String,Object?>> listDataChart = [];
  DateTime timePick = DateTime.now();

  HomeProvider(){
    final logger = Logger();
    logger.i("this shit must run");
    getLisTrans();
    getListDataChart();
  }

  void getLisTrans() async{
    final logger = Logger();
   listTrans = await _repository.getListTransaction();
   listTrans.forEach((element) {
     logger.e(element.toJson().toString());
   });
   notifyListeners();
  }

  void addTrans(TransactionInfo transactionInfo) async{
    TransactionInfo tranNew = await _repository.addNewTransaction(transactionInfo);
    if(tranNew.id != null){
      getLisTrans();
      getListDataChart();
    }
  }

  void deleteTrans(TransactionInfo transactionInfo) async{
    int result = await _repository.deleteTransaction(transactionInfo);
    if(result>0){
      getLisTrans();
      getListDataChart();
    }
  }

  void getListDataChart() async{
    final logger = Logger();
    listDataChart = await _repository.getListTotalAmountWeekly();
    logger.i(listDataChart);
    notifyListeners();
  }


}