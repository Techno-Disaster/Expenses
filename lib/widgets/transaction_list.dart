import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text("No transactions added yet!", style: TextStyle(fontFamily: 'Qpen Sans', fontWeight: FontWeight.bold,),),
                SizedBox(height: 20.0,),
                Container(height: 200, child: Image.asset('images/waiting.png', fit: BoxFit.cover,),),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 20.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorDark,
                              width: 3.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "₹" + transactions[index].amount.toStringAsFixed(2),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat("dd MMMM")
                                  .format(transactions[index].date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
