import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendigPercnt;

  ChartBar(this.label, this.spendingAmount, this.spendigPercnt);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.1,
              child: FittedBox(
                child: Text(
                  "₹" + spendingAmount.toStringAsFixed(0),
                  style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.7,
              width: 23.5,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendigPercnt,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(59, 73, 98, 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    alignment: FractionalOffset.bottomCenter,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.1,
              child: FittedBox(
                child: Text(
                  label,
                  style:
                      TextStyle(fontFamily: 'Open Sans', color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
