import 'package:responsive_and_adaptive_app/db/DbHelper.dart';
import 'package:responsive_and_adaptive_app/db/model/Transaction.dart';

class Repository {
  Future<TransactionInfo> addNewTransaction(TransactionInfo trans) =>
      AppDatabase.instance.addTransaction(trans);
  Future<int> deleteTransaction(TransactionInfo trans) =>
      AppDatabase.instance.deleteTransaction(trans);
  Future<List<TransactionInfo>> getListTransaction() =>
      AppDatabase.instance.getListTransaction();
}
