import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _transactions.map((tx) {
        return Card(
          child: Row(children: [
            Container(
              child: Text(
                '\$${tx.amount}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple,
                ),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat.yMMMd().format(tx.date),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ]),
        );
      }).toList(),
    );
  }
}