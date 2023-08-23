import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home:CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget{
  const CalculatorApp({Key? key}):super(key:key);
  @override
  State<CalculatorApp> createState()=> _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double? num1=0;
  double? num2=0;
  String history='';
  String display='';
  String result="";
  String operation="";

  void onbuttonclick(String text){
    print(text);
    if(text=='C'){
      display='';
      num1=0;
      num2=0;
      result="";
    }
    else if(text=="AC"){
      display='';
      num1=0;
      num2=0;
      result="";
      history='';

    }
    else if (text=="<"){
      if (history.isNotEmpty){
      history=history.substring(0, history.length-1);}
    }

    else if(text =='+'||text =='-'||text =='X'||text =='/'){
      num1=double.parse(display);
      operation=text;
      result='';

    }

    else if(text =='=') {
      num2 =double.parse(display);
      if (operation == '+') {
        result = (num1! + num2!).toString();

        history = num1.toString() + operation.toString() + num2.toString();
      }
      if (operation == '-') {
        result = (num1! - num2!).toString();
        history = num1.toString() + operation.toString() + num2.toString();
      }
      if (operation == 'X') {
        result = (num1! * num2!).toString();
        history = num1.toString() + operation.toString() + num2.toString();
      }
      if (operation == '/') {
        result = (num1! / num2!).toString();
        history = num1.toString() + operation.toString() + num2.toString();
      }
      num1 = 0;
      num2=0;
      operation="";
    }
    else{
      result=int.parse(display+text).toString();
    }
    setState(() {
      display=result;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
     backgroundColor: Colors.black,
      body:Column(
        children: [
          Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color:Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:[
                    Text(
                      history,
                      style: TextStyle(
                        fontSize: 48,
                        color:Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      display,
                      style: TextStyle(
                        fontSize: 30,
                        color:Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),),
          Row(
            children: [
              buttons(
                text: "AC",
                textcolor: orangeColor,
                buttonbg: operatorcolor,
              ),
              buttons(
                text:"C",
                textcolor: orangeColor,
                buttonbg: operatorcolor,
              ),
              buttons(
                text: "<",
                textcolor: orangeColor,
                buttonbg: operatorcolor,
              ),
              buttons(
                text: "/",
                textcolor: orangeColor,
                buttonbg: operatorcolor,
              ),
            ],
          ),
          Row(
            children: [
              buttons(
                text: "7",
              ),
              buttons(
                text: "8",
              ),
              buttons(
                  text: "9"
              ),
              buttons(
                text: "X",
                textcolor: orangeColor,
                buttonbg: operatorcolor,
              ),
            ],
          ),
          Row(
            children: [
              buttons(
                text: "4",
              ),
              buttons(
                text: "5",
              ),
              buttons(
                  text: "6"
              ),
              buttons(
                text: "-",
                textcolor: orangeColor,
                buttonbg: operatorcolor,
              ),
            ],
          ),
          Row(
            children: [
              buttons(
                text: "1",

              ),
              buttons(
                text: "2",

              ),
              buttons(
                  text: "3"
              ),
              buttons(
                text: "+",
                textcolor: orangeColor,
                buttonbg: operatorcolor,
              ),
            ],
          ),
          Row(
            children: [
              buttons(
                text: "00",
              ),
              buttons(
                text: "0",

              ),
              buttons(
                text: "=",
                textcolor: orangeColor,
                buttonbg: operatorcolor,
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget buttons({text,textcolor=Colors.white,buttonbg=buttonColor}){
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.all(22),
            backgroundColor: buttonbg,
          ),
          onPressed: ()=> onbuttonclick(text),
          child:  Text(
            text,
            style:TextStyle(
            fontSize: 26,
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}
