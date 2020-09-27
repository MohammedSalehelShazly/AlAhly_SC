import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'dart:math';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'Player.dart';
import 'Static_Variables.dart';
import 'login_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class TeamPage extends StatefulWidget {


  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  List<Color> allColors =[
    Colors.red, Colors.yellowAccent,Colors.green, Colors.indigo, Colors.grey, Colors.blueGrey ,Colors.pinkAccent , Colors.brown ,Colors.teal ,Colors.purple ,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    /*Text('Name is : ${widget.nameRegister}' , style: TextStyle(fontSize: 35),),

                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop('this value is Undo');
                      },
                      child: Text('Undo Value' , style: TextStyle(color: Colors.white),),
                      color: Colors.purple,
                      splashColor: Colors.transparent,
                      //elevation: 0,
                    ),

                    FloatingActionButton.extended(
                        onPressed: ()=>_addPhoto(),
                        label: Icon(Icons.add)
                    ),*/


                    //myListView(),

                    Container(
                      height : MediaQuery.of(context).size.height*playerImageList.length *0.20,
                      //color: Colors.black87,
                      child: PlayerGrid(),
                    ),
                  ],
                ),
              ),

            ],
          )
        ),
      ),
    );
  }






  myListView(){
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height*2 +(MediaQuery.of(context).size.height * (1/150)),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemExtent: MediaQuery.of(context).size.height/4,
                itemBuilder: (context , index){
                  return Container(
                    color: allColors[index],
                  );
                }
            ),
          ),
        ),

        SizedBox(width: MediaQuery.of(context).size.height/150,),

        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height*2 +(MediaQuery.of(context).size.height * (1/150)),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemExtent: MediaQuery.of(context).size.height/2,
                reverse: true,
                itemBuilder: (context , index){
                  return Container(
                    color: allColors[index],
                  );
                }
            ),
          ),
        ),

      ],
    );
  }



  myGrideView(){
    return Container(
      height: MediaQuery.of(context).size.height*2 +(MediaQuery.of(context).size.height * (14/150)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 1,
              mainAxisSpacing: MediaQuery.of(context).size.height/150,
              crossAxisSpacing: MediaQuery.of(context).size.height/150,
              children: List.generate(8, (index){
                return Container(
                  color: allColors[index],

                  // don't need to dymentions ... crossAxisCount and length of generate control this
                );
              }
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.height/150,),
          Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 1,
              mainAxisSpacing: MediaQuery.of(context).size.height/150,
              crossAxisSpacing: MediaQuery.of(context).size.height/150,
              //primary: true,
              shrinkWrap: true,

              cacheExtent:MediaQuery.of(context).size.height*4/5,
              childAspectRatio: 0.5,

              reverse: true,
              children: List.generate(4, (index){
                return Container(
                  color: allColors[index],
                  // don't need to dimentions ... crossAxisCount and length of generate control this
                );
              }
              ),
            ),
          ),
        ],
      ),
    );
  }


  String resultFromAPI ='';
  _addPhoto() async{
    var url = 'https://example.com/whatsit/create';
    var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    //print('No,1.........Response status: ${response.statusCode}');
    print(response.body);
    //print("No,1.........${await http.read('https://example.com/foobar.txt')}");
  }
}


class PlayerGrid extends StatefulWidget {
  @override
  _PlayerGridState createState() => _PlayerGridState();
}

class _PlayerGridState extends State<PlayerGrid> {


  @override
  void dispose() {
    setState(()=> newIndex = 0);
    super.dispose();
  }

  @override

  int newIndex = 0 ;

  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      itemCount: playerImageList.length*2,
      itemBuilder: (context, index ) {
        return InkWell(
          onTap: (){
            int _index = index.isEven ?
                            (index~/2).toInt() :
                            ((index-1)~/2).toInt() ;
              print( _index ) ;


            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Player(playerImageList[_index] , playerNum[_index] , playerName[_index])
            ));

          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradientColors, begin: Alignment.topCenter , end: Alignment.bottomCenter,),
              //borderRadius: _borderRadias(index)
            ),
            child: index.isEven ? Center(
                child: Hero(
                  tag: 'playerImage$newIndex',
                    child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('${playerImageList[newIndex]}'), fit: BoxFit.cover)),),
                )
            ):
        Column(
            mainAxisAlignment: playerNum[newIndex].length >3 ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text('${playerNum[newIndex]}' ,
                  style: myTextStyle(
                      context , clr: Colors.black ,family: 'HoltwoodOneSC', ratioSize: playerNum[newIndex].length >3 ? 30 :40
                  ).copyWith(fontWeight: FontWeight.normal,),)),

              Text('${playerName[newIndex++]}', style: myTextStyle(context ,ratioSize: 25,clr: Colors.white), textAlign: TextAlign.center,),
            ],
          )
        ),
        );
      },
      staggeredTileBuilder: (int index) =>    // the two index are the same
      StaggeredTile.count(2 ,  index.isEven ? 2 : 1),
// ratio of one item from total(CrossAA) , ratio of one item from total(MainAA)
// if it takes the same crossAA value => one item will take all space of all items in CrossSS   ,   other like it
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
  _borderRadias(int _index){
    var _radius = Radius.circular(30) ;
    var _clearRadius = BorderRadius.circular(0) ;

    //print(_index);
      return _index %4 ==0 ?  BorderRadius.only(topLeft :_radius ) :
      _index.isEven && _index %4 !=0 ? BorderRadius.only(bottomRight :_radius) :
          _index.isEven ? BorderRadius.circular(50):
      _clearRadius ;
  }
}


