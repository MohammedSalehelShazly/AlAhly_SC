import 'dart:math';
import 'dart:ui';

import 'package:alAhlySC/Provider.dart';
import 'package:alAhlySC/Static_Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchesPage extends StatefulWidget {
  @override
  _MatchesPageState createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {

  var scaffolKey = GlobalKey<ScaffoldState>();

  static List <int> ListConstantRandom =[]; // it's just bridge to saving in final list
  generateRandomIndex(index){
    for(int i=0 ; i<otherTeamName.length *3 ; i++){
      index = Random().nextInt(otherTeamName.length) ;
      ListConstantRandom.add(index);
    }
  }
  final List <int> staticIndex = ListConstantRandom ; // final because not change random number when hotReload


  ScrollController myScrollController =  ScrollController();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<MyProvider>(context) ;
    return Scaffold(
      key: scaffolKey,
      body: Stack(
        children: <Widget>[

          CustomScrollView(
            controller: myScrollController,
            slivers: <Widget>[
              mySliverAppBar('images/ulteras.jpg', context),

              SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    List.generate(otherTeamName.length *3 , (index) {
                      generateRandomIndex(index);
                      index =  staticIndex[index] ;
                      return MatchCard(
                        otherTeamLogo: otherTeamLogo[index], otherTeamName:otherTeamName[index],
                        DateMatch: dateOfMatch[index],timeMatch: timeOfMatch[index],
                        championIsLocal: index ==1 ? false : true,
                      );
                    }
                    ),
                  )
              ),
            ],
          ),


          ///myScrollController.offset < 250 ? Container() :
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              onPressed: (){
                setState(() {
                  myScrollController.animateTo(0.0, duration: Duration(seconds: 3), curve: Curves.fastLinearToSlowEaseIn);
                });
              },
              label: Icon(Icons.arrow_upward),
            ),
          ),


          //eagle(context)
        ],
      ),
    );
  }
}


class MatchCard extends StatefulWidget {

  String otherTeamLogo ;
  String otherTeamName ;
  bool championIsLocal ;
  String DateMatch ;
  String timeMatch ;



  MatchCard({this.otherTeamLogo, this.otherTeamName , this.championIsLocal=true , this.DateMatch, this.timeMatch});



  @override
  _MatchCardState createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override


  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: MediaQuery.of(context).size.width/2.3,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset('images/AlAhly_logo.png' ,width: MediaQuery.of(context).size.width/5,height: MediaQuery.of(context).size.height/10,),
                    Text("Al Ahly SC", style: myTextStyle(context ,ratioSize: 13),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.championIsLocal==true ? "Egyption league" : "Champions league"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(widget.DateMatch, style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text(widget.timeMatch),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset(widget.otherTeamLogo,width: MediaQuery.of(context).size.width/5,height: MediaQuery.of(context).size.height/10),
                    Text(widget.otherTeamName , style: myTextStyle(context , ratioSize: 13),),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: ticketButton("Buy Tickets", context ,widget.otherTeamName),),
                Expanded(child: ticketButton("Buy VIP Tickets", context ,widget.otherTeamName),)
              ],
            ),
            Divider(thickness: 4,)
          ],
        ),
      ),
    );
  }

  /*
  scaffolKey.currentState.showSnackBar(SnackBar(
            content: Text('Ticket has been reserved'),
          ));
          */
  ticketButton(String txt, ticketButtonContext , otherTeamName ){
    String ticketClass = txt.contains('VIP') ? 'VIP' :'';
    final bloc = Provider.of<MyProvider>(ticketButtonContext);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap:  (){
          Scaffold.of(ticketButtonContext).showSnackBar(SnackBar(
            content: Text('$otherTeamName Match Ticket $ticketClass has been reserved'),
          ));
        },

        child: Container(
          height: MediaQuery.of(ticketButtonContext).size.height/20,
          child: Center(child: Text(txt, style: TextStyle(color: Colors.black54),)),
          decoration: BoxDecoration(
            border: txt=='Buy Tickets' ? Border(left: myBorderSide, top: myBorderSide) : Border(right: myBorderSide, bottom: myBorderSide),
            //borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
}
