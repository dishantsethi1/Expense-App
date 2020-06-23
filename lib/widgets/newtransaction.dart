import 'package:flutter/material.dart';

class Newtransaction extends StatelessWidget {
  final Function addtx;
  final title = TextEditingController();
  final amount = TextEditingController();
  Newtransaction(this.addtx);

  void submitdata() {
    final etitle = title.text;
    final eamount = double.parse(amount.text);

    if (etitle.isEmpty || eamount <= 0) {
      return;
    }
    addtx(
      etitle,
      eamount,
    );
  }

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
              onSubmitted: (_) => submitdata(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'AMount'),
              // onChanged: (value){
              //   amount=value;
              // },
              controller: amount,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitdata(),
            ),
            FlatButton(
              onPressed: submitdata,
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
