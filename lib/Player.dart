import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Static_Variables.dart';

class Player extends StatefulWidget {
  String playerImage , player_NO , playerName ;


  Player(this.playerImage, this.player_NO, this.playerName);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  int indexOfPlayerPushed ;
  checkIndex() =>setState((){
    if(!mounted)return;
    indexOfPlayerPushed = playerNum.indexOf(widget.player_NO);
  });
  @override
  void initState() {
    checkIndex() ;
    super.initState();
  }
  /*@override
  void dispose() {
    indexOfPlayerPushed = 0;
    super.dispose();
  }*/
  int i =0 ;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(gradient: SweepGradient(colors: gradientColors)),
              height: MediaQuery.of(context).size.height,
              child : DefaultTabController(
                length: playerImageList.length,
                initialIndex: indexOfPlayerPushed,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TabBarView(
                        children: List.generate(playerImageList.length, (__index) => screenPlayer(__index))
                      ),
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height/120,
                      child: TabBar(
                        tabs: List.generate(playerImageList.length, (__index) => Tab(text:'')),

                        indicatorWeight: MediaQuery.of(context).size.height/120,
                        indicatorColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            eagle(context)
          ],
        ),
      ),
    );
  }


  int playerIndex = 0;
  screenPlayer(index){
    setState(()=> playerIndex = index );
   return Column(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: <Widget>[
       Hero(
         tag: 'playerImage$index',
         child: Container(
           width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height*0.7,
           decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage(playerImageList[index]),
                   fit: BoxFit.cover
               )
           ),
         ),
       ),

       Container(
           decoration: BoxDecoration(
               gradient: LinearGradient(
                 colors: gradientColors.sublist(2),
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
               ),
             boxShadow: [BoxShadow(spreadRadius: 10 , blurRadius: 35)]
           ),
           child: RichText(
             text: TextSpan(
                 children: [
                   TextSpan(text: '${playerNum[index]}  ' , style: myTextStyle(context,clr: Colors.white, family: 'HoltwoodOneSC', ratioSize: playerNum[index].length>3 ? 15 : 20 ) ),
                   TextSpan(text: playerName[index].toUpperCase() , style: myTextStyle(context,clr: Colors.white.withOpacity(0.8), ratioSize: 25)),
                 ]
             ),
           )
       ),
     ],
   );
  }
}
