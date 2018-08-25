import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:currency_input_formatter/currency_input_formatter.dart';

import './homepage.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormPageState();
  }
}

class _FormPageState extends State<FormPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  
  String moneyValue   = '';
  String monthValue   = '';
  String percentValue = '';
  String monthlyValue = '';

  _inputMoney() {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      child: TextField(
        keyboardType: TextInputType.number,
        style: new TextStyle(fontSize: 20.0, color: Colors.black),
        onChanged: (String value) {
          setState(() {
            moneyValue = value;
          });
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.account_balance),
          hintText: "จำนวนเงินกู้",
          suffixText: 'บาท',
        ),
      ),
    );
  }

  _inputMonth() {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      child: TextField(
        keyboardType: TextInputType.number,
        style: new TextStyle(fontSize: 20.0, color: Colors.black),
        onChanged: (String value) {
          setState(() {
            monthValue = value;
          });
        },
        decoration: InputDecoration(
          icon: Icon(Icons.schedule),
          border: InputBorder.none,
          hintText: "จำนวนเดือน",
          suffixText: 'เดือน',
        ),
      ),
    );
  }

  _inputPercent(context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      child: TextField(
        keyboardType: TextInputType.number,
        style: new TextStyle(fontSize: 20.0, color: Colors.black),
        onChanged: (String value) {
          setState(() {
            percentValue = value;
          });
        },
        decoration: InputDecoration(
          icon: Icon(Icons.equalizer),
          border: InputBorder.none,
          hintText: "ดอกเบี้ย",
          suffixText: '% ต่อ ปี',
        ),
      ),
    );
  }

  _inputMonthlyPay(context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      child: TextField(
        keyboardType: TextInputType.number,
        style: new TextStyle(fontSize: 20.0, color: Colors.black),
        onChanged: (String value) {
          setState(() {
            monthlyValue = value;
          });
        },
        decoration: InputDecoration(
          icon: Icon(Icons.monetization_on),
          border: InputBorder.none,
          hintText: "ผ่อนต่อเดือน",
          suffixText: 'บาท',
        ),
      ),
    );
  }

  _btnCalulate(context) {
    return Material(
      color: Colors.greenAccent[400],
      child: MaterialButton(
        minWidth: 200.0,
        height: 60.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePage(moneyValue, monthValue, percentValue, monthlyValue)),
          );
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: new Text(
          "คำนวณ",
          style: new TextStyle(fontSize: 22.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('คำนวณค่าผ่อนบ้าน'),
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        new Container(
          height: 5.0,
        ),
        new Container(
          decoration: new BoxDecoration(color: Colors.white),
          margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          child: _inputMoney(),
        ),
        new Container(
          decoration: new BoxDecoration(color: Colors.white),
          margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          child: _inputMonth(),
        ),
        new Container(
          decoration: new BoxDecoration(color: Colors.white),
          margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          child: _inputPercent(context),
        ),
        new Container(
          decoration: new BoxDecoration(color: Colors.white),
          margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          child: _inputMonthlyPay(context),
        ),
        new Container(
          height: 10.0,
        ),
        new Container(
          decoration: new BoxDecoration(color: Colors.white),
          margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          child: _btnCalulate(context),
        ),
      ]),
    );
  }
}
