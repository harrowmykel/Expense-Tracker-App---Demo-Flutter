import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  Chart(this._recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      //calculate the amount spent on that day of the week
      _recentTransactions.forEach((tx) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount;
        }
      });

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(
      0.0,
      (sum, item) => (sum + item['amount']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((groupedTx) {
            //use flexible to distribute space
            return Flexible(
              fit: FlexFit.tight,
              //set proportional width of unit chartbar
              flex: 1,
              child: ChartBar(
                label: groupedTx['day'],
                spendingAmount: groupedTx['amount'],
                spendingPctOfTotal: maxSpending == 0.0
                    ? 0.0
                    : ((groupedTx['amount'] as double) / maxSpending),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
