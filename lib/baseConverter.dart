import 'dart:math';

import 'package:flutter/material.dart';

class BaseConverter extends StatefulWidget {
  @override
  _BaseConverterState createState() => _BaseConverterState();
}

class _BaseConverterState extends State<BaseConverter> {
  var b1= TextEditingController(), b2 = TextEditingController();
  var n1=TextEditingController();
  var ans=0;
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    return Center(
      child: Column(
        children: <Widget>[
          Text("From Base: "),
          TextField(
            controller: b1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          Text("To Base: "),
          TextField(
            controller: b2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          Text("Interger: "),
          TextField(
            controller: n1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          Text("${ans}"),
          RaisedButton(
            child: Text("Convert"),
            onPressed: (){
                setState(() {
                  var base1=int.parse(b1.text);
                  var base2=int.parse(b2.text);
                  var nInBase1=int.parse(n1.text);
                  var nInDecimal=0;
                  var nInBase2=0;
                  int counter=0;
                  while(nInBase1!=0){
                    nInDecimal+=nInBase1%10* pow(base1,counter);
                    nInBase1=nInBase1~/10;
                    print(nInDecimal);
                    counter+=1;
                  }
                  if(base2==10){
                    ans=nInDecimal;
                  }
                  else{
                    counter=1;
                    while(nInDecimal>0) {
                      nInBase2 = nInBase2 + (nInDecimal % base2)* counter;
                      counter=counter*10;
                      nInDecimal = nInDecimal ~/ base2;
                    }
                    ans=nInBase2;
                  }
                });
            },
          )


        ],
      ),
    );
  }
}
