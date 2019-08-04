import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/card.dart';
import './widgets/new_transation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(38, 38, 38, 1),
      ),
    );
    return MaterialApp(
      title: "Expenses",
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: "t1",
    //   title: "Shoes",
    //   amount: 6000.00,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "SODIMM",
    //   amount: 1299.00,
    //   date: DateTime.now(),
    // ),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _addNewTransaction(
      String txtitle, double txamount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: ctx,
        elevation: 30,
        builder: (_) {
          return NewTrasaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 38, 38, 100),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(38, 38, 38, 100),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
        title: Text(
          "My Expenses",
          style:
              TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        elevation: 20,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
