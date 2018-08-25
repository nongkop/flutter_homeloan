import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Griddetail extends StatelessWidget {

  Griddetail(this.money, this.permonth, this.month, this.totalInterest, this.percent);

  int money;
  int permonth;
  int month;
  int totalInterest;
  double percent;

  final formatter = new NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    
    List<Widget> _tiles = <Widget>[
      _BuildCard(Colors.white, Icons.wifi, 'เงินกู้', formatter.format(money)),
      _BuildCard(Colors.white, Icons.widgets, 'ผ่อนเดือนละ', formatter.format(permonth)),
      _BuildCard(Colors.white, Icons.panorama_wide_angle, 'จำนวนเดือน', formatter.format(month)),
      _BuildCard(Colors.white, Icons.map, 'ดอกเบี้ย', formatter.format(totalInterest)),
      _BuildCard(Colors.white, Icons.map, 'ดอกเบี้ย', "$percent"),
    ];

    return Container(
      child: new GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        children: _tiles,
        padding: const EdgeInsets.all(5.0),
      ),
    );
  }
}

class _BuildCard extends StatelessWidget {
  const _BuildCard(
      this.backgroundColor, this.iconData, this.textData, this.textNumber);

  final Color backgroundColor;
  final IconData iconData;
  final String textData;
  final String textNumber;

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = const TextStyle(
        color: Colors.black54, fontSize: 25.0, fontWeight: FontWeight.w600);

    final headerPriceStyle = const TextStyle(
        color: Colors.black54, fontSize: 30.0, fontWeight: FontWeight.w600);

    return new Card(
        margin: const EdgeInsets.all(10.0),
        color: backgroundColor,
        child: new Column(
          children: <Widget>[
            new Container(height: 40.0),
            new Text(
              textData,
              style: headerTextStyle,
            ),
            new Container(height: 20.0),
            new Text(
              textNumber,
              style: headerPriceStyle,
            ),
            new Container(height: 10.0),
          ],
        ));
  }
}
