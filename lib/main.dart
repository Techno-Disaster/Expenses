import 'package:expenses/widgets/transaction_list.dart';

import './widgets/new_transation.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses",
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Quicksand'),
      
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTrasaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
        title: Text("My Expenses", style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text("Chart dalne wala hu yaha"),
                elevation: 10.0,
              ),
            ),
            TransactionList(_userTransactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        elevation: 30,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
