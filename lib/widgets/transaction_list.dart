import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTx;

  TransactionList(this._transactions, this._deleteTx);

  @override
  Widget build(BuildContext context) {
    if (_transactions.isEmpty) {
      return Column(
        children: [
          Text(
            'No Transactions added yet!',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            //image is wrapped into container, so that it fits
            child: Image.asset(
              "assets/images/waiting.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        final Transaction tx = _transactions[index];
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: ListTile(
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  child: Text('\$${tx.amount.toStringAsFixed(2)}'),
                ),
              ),
            ),
            title: Text(
              tx.title,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(DateFormat.yMMMd().format(tx.date)),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
              onPressed: () {
                _deleteTx(tx.id);
              },
            ),
          ),
        );
      },
      itemCount: _transactions.length,
    );
  }
}
