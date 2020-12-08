import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeActivity(),
  )
);

class HomeActivity extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  //first declare variable
  String Output = "0";
  String _Out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";


  PressedButton(String val){
      print(val);
      // add Condition
      if(val == "C"){
        _Out = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
      }
      else if(val == "+" || val == "-" || val == "*" || val == "/"){
          num1 = double.parse(Output);
          operand = val;
          _Out = "0";
          Output = Output+val;
      }
      else if(val == "."){
        if(_Out.contains(".")){
          return;
        }
        else{
         _Out = _Out+val;
        }
      }
      else if(val == "="){
        num2 = double.parse(Output);
        if(operand == "+"){
          _Out = (num1+num2).toString();
        }  if(operand == "-"){
          _Out = (num1-num2).toString();
        }  if(operand == "/"){
          _Out = (num1/num2).toString();
        }  if(operand == "*"){
          _Out = (num1*num2).toString();
        }
        num2 = 0.0;
        num1 = 0.0;
      }else{
        _Out =_Out+val;
      }
      setState(() {
        Output = double.parse(_Out).toStringAsFixed(2);
      });
  }

  //Create Button Widget
  Widget CalcBtn(String BtnVal){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            boxShadow:[
              BoxShadow(
                color: Colors.grey[500],
                offset: Offset(2.0,2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-2.0,-2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
            ]
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(30.0),
          child: Text(BtnVal ,style: TextStyle(
            fontSize: 22.0,
          ),),
          onPressed: ()=> PressedButton(BtnVal) ,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: Colors.grey[300],
         body: Container(
           child: Column(
             children: <Widget>[
               Container(
                 alignment: Alignment.bottomRight,
                 padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 50.0),
                 child: Text(Output,style: TextStyle(
                   fontSize: 60.0,
                 ),),
               ),
                Expanded(
                  child: Divider(),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                          CalcBtn("."),
                          CalcBtn("C"),
                          CalcBtn("←"),
                          CalcBtn("*"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CalcBtn("7"),
                        CalcBtn("8"),
                        CalcBtn("9"),
                        CalcBtn("/"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CalcBtn("4"),
                        CalcBtn("5"),
                        CalcBtn("6"),
                        CalcBtn("+"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CalcBtn("1"),
                        CalcBtn("2"),
                        CalcBtn("3"),
                        CalcBtn("-"),
                      ],
                    ),  Row(
                      children: <Widget>[
                        CalcBtn("0"),
                        CalcBtn("="),

                      ],
                    ),

                  ],
                )
             ],
           ),
         ),
      ),
    );
  }
}