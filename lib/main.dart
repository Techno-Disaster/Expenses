import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/card.dart';
import './widgets/new_transation.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(12, 14, 21, 1.0),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final List<Transaction> _userTransactions = [];
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
    final appBar = AppBar(
      centerTitle: true,
      backgroundColor: Color.fromRGBO(12, 14, 21, 1.0),
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
        style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold),
      ),
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(12, 14, 21, 1.0),
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.32,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.68,
              child: TransactionList(_userTransactions, _deleteTransaction),
            ),
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
