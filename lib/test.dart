

import 'package:alAhlySC/test_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  String image ='images/Ahly_Eagle.png' ;
  bool loading = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(title: Text('Hero Test'),centerTitle: true,),

        floatingActionButton: FloatingActionButton(
          heroTag: 'HeroTag_Page',
          onPressed: () async{
            setState(()=> loading = true );
            await Navigator.push(
                context,
                MaterialPageRoute (
                    builder: (context){
                      return Test_2();
                    }
                ));
            setState(()=> loading = false );
          },
          child: loading ?  CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.lightBlue),) : Icon(Icons.swap_vertical_circle),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        body: Container(
          width: MediaQuery.of(context).size.width*0.6,
          height: MediaQuery.of(context).size.width*0.4,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            )
          ),
      )
    );
  }
}
