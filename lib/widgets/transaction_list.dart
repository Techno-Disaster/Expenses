import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transactions added yet!",
                  style: TextStyle(
                      fontFamily: 'Qpen Sans',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 9),
                  elevation: 6,
                  color: Color.fromRGBO(38, 38, 38, 100),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromRGBO(76, 164, 225, 1.0),
                      foregroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            "₹" + transactions[index].amount.toStringAsFixed(0),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      DateFormat("dd MMMM").format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
