import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transation.dart';
import '../models/transaction.dart';

class UserTransations extends StatefulWidget {
  @override
  _UserTransationsState createState() => _UserTransationsState();
}

class _UserTransationsState extends State<UserTransations> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: "Shoes",
      amount: 6000.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t1",
      title: "SODIMM",
      amount: 1299.00,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTrasaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
