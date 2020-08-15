import 'package:calc_app/button_operator.dart';
import 'package:calc_app/calculate.dart';
import 'package:calc_app/widgets/number_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculatorUi extends StatefulWidget {
  final String str;
  final String title;

  CalculatorUi({Key key, @required this.title, @required this.str})
      : super(key: key);
  @override
  _CalculatePotraitState createState() => _CalculatePotraitState(this.str);
}

class _CalculatePotraitState extends State<CalculatorUi> {
  String _str;
  _CalculatePotraitState(this._str);

  void update(String val) {
    Compute.add(val);
    setState(() {
      this._str = Compute.str;
    });
  }

  void clear() {
    setState(() {
      Compute.clear();
      this._str = Compute.str;
    });
  }

  void delete() {
    setState(() {
      Compute.delete();
      this._str = Compute.str;
    });
  }

  void compute() {
    if (Compute.str.compareTo('0') != 0) {
      setState(() {
        this._str = Compute.compute();
        Compute.str = this._str;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      this._str = Compute.str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.black,
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 30),
                  child: Text(
                    _str,
                    textScaleFactor: 3.0,
                    style: TextStyle(fontSize: 20, color: Colors.lime),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  NumberButton('C', () {
                    clear();
                  }, 9, Colors.black),
                  NumberButton('DEL', () {
                    delete();
                  }, 3, Colors.black),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  NumberButton('7', () {
                    update('7');
                  }, 3, Colors.black),
                  NumberButton('8', () {
                    update('8');
                  }, 3, Colors.black),
                  NumberButton('9', () {
                    update('9');
                  }, 3, Colors.black),
                  ButtonOperator('+', () {
                    update('+');
                  }, 3, Colors.lime),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  NumberButton('4', () {
                    update('4');
                  }, 3, Colors.black),
                  NumberButton('5', () {
                    update('5');
                  }, 3, Colors.black),
                  NumberButton('6', () {
                    update('6');
                  }, 3, Colors.black),
                  ButtonOperator('-', () {
                    update('-');
                  }, 3, Colors.lime),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  NumberButton('1', () {
                    update('1');
                  }, 3, Colors.black),
                  NumberButton('2', () {
                    update('2');
                  }, 3, Colors.black),
                  NumberButton('3', () {
                    update('3');
                  }, 3, Colors.black),
                  ButtonOperator('*', () {
                    update('*');
                  }, 3, Colors.lime),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  NumberButton('0', () {
                    update('0');
                  }, 3, Colors.black),
                  NumberButton('.', () {
                    update('.');
                  }, 3, Colors.black),
                  ButtonOperator('=', () {
                    compute();
                  }, 3, Colors.lime),
                  ButtonOperator('/', () {
                    update('/');
                  }, 3, Colors.lime),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
