import 'package:flutter/material.dart';
import './card.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendigPercnt;

  ChartBar(this.label, this.spendingAmount, this.spendigPercnt);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
                  child: Text(
            "₹" + spendingAmount.toStringAsFixed(0), style: TextStyle(fontFamily: 'Open Sans'),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          height: 120.0,
          width: 35.0,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 5.0),
                  color: Color.fromRGBO(220, 220, 220, 50),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendigPercnt,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text("Days", style: TextStyle(fontFamily: 'Open Sans'),),
      ],
    );
  }
}
