import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendigPercnt;

  ChartBar(this.label, this.spendingAmount, this.spendigPercnt);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 15,
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
          height: 5.0,
        ),
        Container(
          height: 120.0,
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
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontFamily: 'Open Sans', color: Colors.white),
        ),
      ],
    );
  }
}
