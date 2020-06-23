import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenttransactions;
  Chart(this.recenttransactions);

  List<Map<String, Object>> get groupedtransactions {
    return List.generate(7, (index) {
      final Weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalsum = 0.0;

      for (var i = 0; i < recenttransactions.length; i++) {
        if (recenttransactions[i].date.day == Weekday.day &&
            recenttransactions[i].date.month == Weekday.month &&
            recenttransactions[i].date.year == Weekday.year) {
          totalsum = totalsum+recenttransactions[i].amount;
        }
      }
      print(DateFormat.E().format(Weekday));
      print(totalsum);

      return {
        'Day': DateFormat.E().format(Weekday),
        'amount': totalsum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
print(groupedtransactions);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
