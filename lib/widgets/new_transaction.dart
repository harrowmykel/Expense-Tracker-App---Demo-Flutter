import 'package:flutter/material.dart';

/**
 * changed to stateful so that data is not lost on rebuild
 */
class NewTransaction extends StatefulWidget {
  final Function _addTransactionFunction;

  NewTransaction(this._addTransactionFunction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    //access widget properties/fns with widget. from state
    widget._addTransactionFunction(
      enteredTitle,
      enteredAmount,
    );

    //auto close bottom sheet of submit
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
              ),
              TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onSubmitted: (_) => _submitData(),
              ),
              Row(children: <Widget>[
                Text('No Date Chosen'),
                TextButton(
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _submitData(),
                ),
              ]),
              ElevatedButton(
                child: Text(
                  'Add Transaction',
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).textTheme.button.color),
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                onPressed: () => _submitData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
