import 'package:flutter/material.dart';

class Newtransaction extends StatelessWidget {
  final Function addtx;
  final title = TextEditingController();
  final amount = TextEditingController();
  Newtransaction(this.addtx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (value){
              //   title=value;
              // },
              controller: title,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'AMount'),
              // onChanged: (value){
              //   amount=value;
              // },
              controller: amount,
            ),
            FlatButton(
              onPressed: () {
                addtx(
                  title.text,
                  double.parse(amount.text),
                );
              },
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
