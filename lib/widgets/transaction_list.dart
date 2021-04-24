import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

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
        return TransactionItem(
          tx: tx,
          deleteTx: _deleteTx,
          key: ValueKey(tx.id),
        );
      },
      itemCount: _transactions.length,
    );
  }
}
