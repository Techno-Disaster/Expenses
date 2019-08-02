import 'package:flutter/material.dart';

class NewTrasaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTrasaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              child: Text("New"),
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(
                    amountController.text,
                  ),
                );
              },
            ) //Have to customize cursor later
          ],
        ),
      ),
    );
  }
}
