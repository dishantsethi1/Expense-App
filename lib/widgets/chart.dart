import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chartbar.dart';

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
          totalsum = totalsum + recenttransactions[i].amount;
        }
      }
      print(DateFormat.E().format(Weekday));
      print(totalsum);

      return {
        'Day': DateFormat.E().format(Weekday).substring(0, 1),
        'amount': totalsum,
      };
    }).reversed.toList();
  }

  double get maxspending {
    return groupedtransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedtransactions);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedtransactions.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['Day'],
                data['amount'],
                maxspending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / maxspending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
