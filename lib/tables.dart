import 'package:flutter/material.dart';
class Mystack extends StatefulWidget {
  const Mystack({super.key});
  @override
  State<Mystack> createState() => _Mystack();
}
class _Mystack extends State<Mystack> {
  TextStyle fun2()
  {
    return TextStyle(
        fontSize: 30
    );
  }
  Container fun(int val)
  {
    return Container(
        child: Column(
          children: [
            Text(val.toString()+" X "+1.toString()+" = "+(val*1).toString(),style: fun2(),),
            Text(val.toString()+" X "+2.toString()+" = "+(val*2).toString(),style: fun2(),),
            Text(val.toString()+" X "+3.toString()+" = "+(val*3).toString(),style: fun2(),),
            Text(val.toString()+" X "+4.toString()+" = "+(val*4).toString(),style: fun2(),),
            Text(val.toString()+" X "+5.toString()+" = "+(val*5).toString(),style: fun2(),),
            Text(val.toString()+" X "+6.toString()+" = "+(val*6).toString(),style: fun2(),),
            Text(val.toString()+" X "+7.toString()+" = "+(val*7).toString(),style: fun2(),),
            Text(val.toString()+" X "+8.toString()+" = "+(val*8).toString(),style: fun2(),),
            Text(val.toString()+" X "+9.toString()+" = "+(val*9).toString(),style: fun2(),),
            Text(val.toString()+" X"+10.toString()+" = "+(val*10).toString(),style: fun2(),),
          ],
        )
    );
  }
  int val = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Text("Stack and Slider"),
          centerTitle: true,
        ),
        body: Stack(
            alignment: Alignment.center,
            children:[
              Text(val.toString(),style: TextStyle(fontSize: 500),),
              Column(
                  children:[
                    Slider(
                      label: "Select val",
                      value: val.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          val = value.toInt();
                        });
                      },
                      min: 1,
                      max: 10,
                    ),
                    Container(
                      child: fun(val),
                    )
                  ]
              ),
            ]
        ),
    );
    }
}