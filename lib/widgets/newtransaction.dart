import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Newtransaction extends StatefulWidget {
  final Function addtx;

  Newtransaction(this.addtx);

  @override
  _NewtransactionState createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  final title = TextEditingController();

  final amount = TextEditingController();
  DateTime _selecteddate;

  void _submitdata() {
    if (amount.text.isEmpty) {
      return;
    }
    final etitle = title.text;
    final eamount = double.parse(amount.text);

    if (etitle.isEmpty || eamount <= 0 || _selecteddate == null) {
      return;
    }
    widget.addtx(
      etitle,
      eamount,
      _selecteddate,
    );
    Navigator.of(context).pop();
  }

  void _datepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        _selecteddate = pickeddate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                // onChanged: (value){
                //   title=value;
                // },
                controller: title,
                onSubmitted: (_) => _submitdata(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'AMount'),
                // onChanged: (value){
                //   amount=value;
                // },
                controller: amount,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitdata(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selecteddate == null
                            ? 'No date chosen! '
                            : 'Picked Date : ${DateFormat.yMd().format(_selecteddate)}',
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _datepicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _submitdata,
                child: Text('Add Transaction'),
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
