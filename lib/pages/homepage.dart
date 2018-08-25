import 'package:flutter/material.dart';
import './griddetail.dart';

class HomePage extends StatelessWidget {
  HomePage(
      this.moneyValue, this.monthValue, this.percentValue, this.monthlyValue);

  String moneyValue;
  String monthValue;
  String percentValue;
  String monthlyValue;

  @override
  Widget build(BuildContext context) {
    int money = int.parse(moneyValue);
    int month = int.parse(monthValue);
    double percent = double.parse(percentValue);

    int permonth = int.parse(monthlyValue);

    double divValue;
    int interest;
    int totalInterest = 0;
    int divBase;

    int baseMoney = money;

    print(baseMoney);

    for (var i = 1; i <= month; i++) {
      if (money > permonth) {
        divValue = (money * percent) / 100 / 365 * 30;
        interest = divValue.round();
        divBase = permonth - interest;
        money = money - divBase;

        totalInterest = totalInterest + interest;
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('คำนวณค่าผ่อนบ้าน'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Griddetail(baseMoney, permonth, month, totalInterest, percent),
          Material(
            color: Colors.greenAccent[400],
            child: MaterialButton(
              minWidth: 200.0,
              height: 60.0,
              textColor: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: Text("Back", style: new TextStyle(fontSize: 22.0),),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
