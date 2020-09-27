
import 'package:flutter/material.dart';
TextStyle myTextStyle(myContext ,{Color clr = Colors.red , int ratioSize=20 , bool wantShadow=false , family = 'Orbitron'}){
  return TextStyle(
      fontSize: MediaQuery.textScaleFactorOf(myContext)*ratioSize ,
      color: clr,
      fontFamily: family,
    shadows: wantShadow==true ? [Shadow(blurRadius: 5 , color: clr==Colors.red ? Colors.black : Colors.red)] : null,
    fontWeight: FontWeight.bold
    //backgroundColor: Colors.black26
  );
}

mySliverAppBar(img , mySlvrContext , {Color colorOfTitle , ratioHeight=0.15}){
  return SliverAppBar(
    expandedHeight: MediaQuery.of(mySlvrContext).size.height *ratioHeight,
    floating: true,
    pinned: true,
    centerTitle: true,
    backgroundColor: Colors.black54,
    leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: ()=>Navigator.pop(mySlvrContext),tooltip: 'Back',),
    flexibleSpace: FlexibleSpaceBar(
      background: Image.asset(img, fit: BoxFit.cover,),
      title: Text('Club of the Century' ,
        style: myTextStyle(mySlvrContext , ratioSize: 15 , wantShadow:  true , clr: colorOfTitle==null ? Colors.red : colorOfTitle),
      ),
      centerTitle: true,
    ),
  );
}
Positioned eagle (_context)=> Positioned(
  top:  -MediaQuery.of(_context).size.width/20 ,
  left: -MediaQuery.of(_context).size.width/20 ,
  child: Opacity(
    opacity: 0.7,
    child: Container(
      child: Image.asset('images/Ahly_Eagle.png',
        width: MediaQuery.of(_context).size.width*0.4,
        height: MediaQuery.of(_context).size.width*0.4,
      ),
    ),
  ),
);

BorderSide myBorderSide = BorderSide(color: Colors.red, width: 3,);

List <Color>gradientColors = [Colors.black87 , Colors.red , Colors.red[800] , Colors.black87];

List playerImageList = [
  'images/p_trika.jpg',
  'images/p_ghaly.jpg',
  'images/p_gouma.jpg',
  'images/p_walid.jpg',
  'images/p_coach.jpg',
  'images/p_elShahat.jpg',
  'images/p_shenawy.jpg',
  'images/p_maaloul.jpg',
  'images/p_solia.jpg',
  'images/p_7amdy_f.jpg',
  'images/p_afsha.jpg',
  'images/p_kahraba.jpg',
  'images/p_metwaly.jpg',
  'images/p_diang.jpg',
];
Map <String, String> map_player_num_name = {
  '22' : 'Abu Trika',
  '14' : 'H.Ghali',
  '6' : 'W.Goumaa',
  '11': 'W.Soliman',
  'Coach' : 'René Weiler',
  '14.' : 'H.ElSHahat',
  '16' : 'ElSHenawy',
  '21' :'Ali Maloul' ,
  '17' : 'ElSoulaia',
  '8' : 'H.Fathy',
  '19' : 'M.Afsha',
  '26' : 'M.Kahraba',
  '4' : 'M.Metwaly',
  '15' : 'E.Diang',
};
List<String> playerNum = map_player_num_name.keys.toList();
List<String> playerName = map_player_num_name.values.toList();


Map <String , String> otherTeam = {
  'Zamalec SC' : 'images/club_Zabalek.png' ,
  'Elwedad AC' : 'images/club_Elwedad.png' ,
  'ElGouna FC' : 'images/club_ElGouna.png' ,
  'Pyramids FC' : 'images/club_Pyramids.png' ,
};
List <String> otherTeamName = otherTeam.keys.toList() ;
List <String> otherTeamLogo = otherTeam.values.toList() ;


Map <String , String> time ={
  'SAT 22 AGU' : '21:00' ,
  'FRI 2 OCT' : '21:00 PM' ,
  'WED 16 AUG' : '21:00 PM' ,
  'THU 15 OCT': '21:00 PM' ,
};

List <String> dateOfMatch = time.keys.toList() ;
List <String> timeOfMatch = time.values.toList() ;

















