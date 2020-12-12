import 'package:flutter/material.dart';
import 'blinking.dart';
import 'package:flutter/services.dart';
class BinaryCalculator extends StatefulWidget {
  @override
  _BinaryCalculatorState createState() => _BinaryCalculatorState();
}

class _BinaryCalculatorState extends State<BinaryCalculator> {
  final n1 = TextEditingController(), n2 = TextEditingController();
  var answer=0;
  int counterOperation=-1;
  var operation = ["&","|","^"];
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlinkingTextAnimation(),
          ),
          TextField(
            maxLength: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: n1,
            keyboardType: TextInputType.number,
          ),
          TextField(
            maxLength: 5,
            controller: n2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          result(operation,counterOperation,answer, n1.text,n2.text),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text("And &"),
                onPressed: (){
                  FocusScope.of(context).requestFocus(new FocusNode());
                  setState(() {
                    answer = int.parse(n1.text) & int.parse(n2.text);
                    counterOperation = 0;
                  });
                },
              ),
              RaisedButton(
                child: Text("Or |"),
                onPressed: (){
                  FocusScope.of(context).requestFocus(new FocusNode());
                  setState(() {
                    answer = int.parse(n1.text) | int.parse(n2.text);
                    counterOperation = 1;
                  });
                },
              ),
              RaisedButton(
                child: Text("Xor ^"),
                onPressed: (){
                  FocusScope.of(context).requestFocus(new FocusNode());
                  setState(() {
                    answer = int.parse(n1.text) ^ int.parse(n2.text);
                    counterOperation = 2;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget result(var opr, int counter, int res, n1, n2){
    if(counter==-1 || n1==" " || n2==" " ){
      return Card(
        child: Text("Enter Number in dialogue box"),
      );
    }
    else{
      return Card(
        child: Text("${int.parse(n1)} ${opr[counter]} ${int.parse(n2)} = ${res}")
      );
    }
  }
}





