import 'package:flutter/material.dart';

class Cal extends StatefulWidget {
  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Cal> {
  late int firstnum = 0;
  late int secondnum = 0;
  late String textToDisplay = "0";
  late String res = "0";
  late String operatorPerform = " ";
  void btnClicked(String btnval) {
    if (btnval == "C") {
      textToDisplay = "0";
      firstnum = 0;
      secondnum = 0;
      operatorPerform = "";
      res = "0";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstnum = int.parse(textToDisplay);

      res = "";
      operatorPerform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(textToDisplay);
      if (operatorPerform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatorPerform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatorPerform == "x") {
        res = (firstnum * secondnum).toString();
      }
      if (operatorPerform == "/") {
        res = (firstnum / secondnum).toString();
      }
    } else {
      res = int.parse(textToDisplay + btnval).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  Widget Custombutton(String value) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(5.0, 5.0),
            blurRadius: 8.0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        child: Text(
          "$value",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        onPressed: () => btnClicked(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Calculator"),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "$firstnum",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$operatorPerform",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " $secondnum",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Result = $textToDisplay",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Custombutton("7"),
                  Custombutton("8"),
                  Custombutton("9"),
                  Custombutton("x"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Custombutton("4"),
                  Custombutton("5"),
                  Custombutton("6"),
                  Custombutton("-"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Custombutton("1"),
                  Custombutton("2"),
                  Custombutton("3"),
                  Custombutton("+"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Custombutton("C"),
                  Custombutton("0"),
                  Custombutton("="),
                  Custombutton("/"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
