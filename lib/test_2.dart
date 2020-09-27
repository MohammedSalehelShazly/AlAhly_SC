import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test_2 extends StatefulWidget {
  @override
  _Test_2State createState() => _Test_2State();
}

class _Test_2State extends State<Test_2> {




  Widget build(BuildContext context) {
    return Hero(
      tag: 'HeroTag_Page',
      child: Scaffold(
          backgroundColor: Colors.deepPurpleAccent,
          appBar: AppBar(title: Text('Test 2'),centerTitle: true,),

          body: Center(
            child: Container(
              child: myTime(),
            ),
          )
      ),
    );
  }


  Duration _Duration = Duration(seconds: 3) ;
  bool hideImage =true ;
  myTime(){
    Timer(_Duration , (){
      setState( ()=> hideImage=false);
    });
    return AnimatedContainer(
      duration: _Duration,
      child: hideImage ? CupertinoActivityIndicator(radius: 30,) :Image.asset('images/AlAhly_logo.png'),
    );
  }
}