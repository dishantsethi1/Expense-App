import 'package:flutter/material.dart';

class Newtransaction extends StatefulWidget {
  final Function addtx;

  Newtransaction(this.addtx);

  @override
  _NewtransactionState createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  final title = TextEditingController();

  final amount = TextEditingController();

  void submitdata() {
    final etitle = title.text;
    final eamount = double.parse(amount.text);

    if (etitle.isEmpty || eamount <= 0) {
      return;
    }
    widget.addtx(
      etitle,
      eamount,
    );
    Navigator.of(context).pop();
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
