import 'package:flutter/material.dart';
import './newtransaction.dart';
import './transactionlist.dart';
import '../models/transaction.dart';

class Usertransactions extends StatefulWidget {
  @override
  _UsertransactionsState createState() => _UsertransactionsState();
}

class _UsertransactionsState extends State<Usertransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      amount: 500,
      title: 'Fees',
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      amount: 2500,
      title: 'Books',
      date: DateTime.now(),
    ),
  ];

  void _addnew(String txtitle, double txamount) {
    final newtx = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Newtransaction(_addnew),
        Transactionlist(_userTransactions),
      ],
    );
  }
}
