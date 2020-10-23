import 'package:MobileFlutterTest/modules/model/wealthSummaryModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const colorBlue = Color.fromRGBO(59, 92, 184, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorGray = Color.fromRGBO(96, 99, 119, 1);

class CardFlipperTest extends StatelessWidget {
  final WealthSummaryModel summary;

  const CardFlipperTest({Key key, this.summary}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      color: colorWhite,
      child: Container(
        padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _linha1(),
            _linha2(),
            _linha3(this.summary.total),
            _linha4(this.summary.profitability),
            _linha5(this.summary.cdi),
            _linha6(this.summary.gain),
            _linha7(),
            _linha8(),
          ],
        ),
      ),
    );
  }

  TextStyle _styleBlue(double fontsize) {
    return TextStyle(
        color: colorBlue,
        fontSize: fontsize,
        fontFamily: 'ProximaNova',
        fontWeight: FontWeight.w800);
  }

  TextStyle _styleGray(double fontsize) {
    return TextStyle(
        color: colorGray,
        fontSize: fontsize,
        fontFamily: "ProximaNovaMedium",
        fontWeight: FontWeight.w500);
  }

  Widget _linha1() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 22.0, 0.0, 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "Seu resumo",
              style: _styleBlue(30.0),
            ),
          ),
          IconButton(icon: Icon(Icons.more_vert), onPressed: null)
        ],
      ),
    );
  }

  Widget _linha2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 5.0),
      child: Center(
        child: Text(
          "Valor Investido",
          style: _styleGray(18.0),
        ),
      ),
    );
  }

  Widget _linha3(dynamic total) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 30.0),
      child: Center(
        child: Text(
          "R\$ $total",
          style: _styleBlue(22.0),
        ),
      ),
    );
  }

  Widget _linha4(dynamic profitability) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 7.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            "Rentabilidade/mês",
            style: _styleGray(19.0),
          )),
          Text(
            "$profitability%",
            style: _styleBlue(20.0),
          ),
        ],
      ),
    );
  }

  Widget _linha5(dynamic cdi) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            "CDI",
            style: _styleGray(19.0),
          )),
          Text(
            "$cdi%",
            style: _styleBlue(20.0),
          ),
        ],
      ),
    );
  }

  Widget _linha6(dynamic gain) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            "Ganho/mês",
            style: _styleGray(19.0),
          )),
          Text(
            "R\$ $gain",
            style: _styleBlue(20.0),
          ),
        ],
      ),
    );
  }

  Widget _linha7() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              thickness: 2.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _linha8() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          RaisedButton(
            child: Text("VER MAIS", style: _styleBlue(16.0)),
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0),
              side: BorderSide(color: colorBlue, width: 1.0),
            ),
          )
        ],
      ),
    );
  }
}
