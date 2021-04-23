import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String titleInput;
  // String amountInput;
  
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Cars',
      amount: 39.99,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart!'),
                elevation: 5,
              ),
            ),
            Card(
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
                      // onChanged: (valueInput){
                      //   titleInput = valueInput;
                      // },
                      controller: titleController,                      
                    ),
                    TextField(
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                      // onChanged: (valueInput){
                      //   amountInput = valueInput;
                      // },
                      controller: amountController,
                    ),
                    TextButton(
                      child: Text(
                        'Add Transaction',
                        style: TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                      onPressed: (){
                        titleController.text;
                        amountController.text;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Column(
                children: transactions.map((tx) {
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
            }).toList()),
          ]),
    );
  }
}
