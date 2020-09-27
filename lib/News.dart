import 'package:alAhlySC/TeamPage.dart';
import 'package:alAhlySC/TeamPage.dart';
import 'package:alAhlySC/VideosPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MachesPage.dart';
import 'Static_Variables.dart';
class News extends StatefulWidget {


  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {


  int selectedPageItem = 0 ;
  List pages = [newsPage() , MatchesPage() , VideosPage() , TeamPage() ,Scaffold(body: Container())];

  String nameRegister = '';
  @override
  void didChangeDependencies() {
    nameRegister = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
          size: MediaQuery.of(context).size.width/14,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.redAccent,
          size: MediaQuery.of(context).size.width/12,
        ),
        selectedLabelStyle: TextStyle( fontSize: MediaQuery.textScaleFactorOf(context)*15),

        selectedItemColor: Colors.red[800],

        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,

        currentIndex: selectedPageItem,
        onTap: (index){
          setState(() => selectedPageItem=index);
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/AlAhly_logo.png', width: MediaQuery.of(context).size.width/15,),
            icon:  Image.asset('images/AlAhly_Sticker_logo.png', width: MediaQuery.of(context).size.width/15,),
            title: Text('News'),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.event), title: Text('Matches'),),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), title: Text('Videos'),),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('images/team.png')), title: Text('Team'),),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), title: Text('More'),),
        ],
      ),
      body: pages[selectedPageItem] , //make this cause cant add parameter nameRegister in MorePage in the list Pages
    );
  }
}


class newsPage extends StatefulWidget {
  @override
  _newsPageState createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              mySliverAppBar('images/studium.jpg' , context),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Container(
                        decoration: BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
                        child: Center(child: Text('Most Reading' , style: myTextStyle(context ,  family: 'Amiri' , ratioSize: 25 , wantShadow: false , clr: Colors.black),)),
                    ),
                    influentialNews(image: 'images/News_0.jpg' , title: "أبو تريكه: التطبيع خيانه مهما حاولوا تجميله" ,),
                    Container(
                        decoration: BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
                        child: Center(child: Text('Trending Last 24 Hours' , style: myTextStyle(context ,  family: 'Amiri' , ratioSize: 25 , wantShadow: false , clr: Colors.black87),))),
                    Container(
                      height: MediaQuery.of(context).size.height/(51/21),
                      color: Colors.red[100].withOpacity(0.3),
                      child: Stack(
                        children: <Widget>[
                          CustomScrollView(
                            scrollDirection: Axis.horizontal,
                            slivers: <Widget>[
                              SliverList(
                                delegate: SliverChildListDelegate.fixed(
                                  [

                                    Container(
                                      width: MediaQuery.of(context).size.width/1.7,
                                      height: MediaQuery.of(context).size.height/(51/21),
                                      child: NewsCard('images/News_1.png'),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.7,
                                      height: MediaQuery.of(context).size.height/(51/21),
                                      child: NewsCard('images/News_2.png'),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.7,
                                      height: MediaQuery.of(context).size.height/(51/21),
                                      child: NewsCard('images/News_3.png'),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.7,
                                      height: MediaQuery.of(context).size.height/(51/21),
                                      child: NewsCard('images/News_4.png'),
                                    ),
                                  ]
                                ),
                              )
                            ],
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height:  MediaQuery.of(context).size.height/(51/21)*0.8,
                              width: 5,
                              decoration: BoxDecoration(
                                  //color: Colors.black,
                                boxShadow:[
                                  BoxShadow(
                                      blurRadius: 20 , offset: Offset(0,0) , spreadRadius:20,color: Colors.white70
                                  )
                                ]
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Divider(
                      thickness: MediaQuery.of(context).size.height/150,color: Colors.black,
                      height: MediaQuery.of(context).size.height/150,),
                    Container(
                      decoration: BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
                      child: Center(child: Text('Influential  News' ,
                        style: myTextStyle(context ,  family: 'Amiri' , ratioSize: 25 , wantShadow: false , clr: Colors.black87),)
                      ),
                    ),

                    influentialNews(image: 'images/Influential_1.jpg' , title: "طاهر محمد طاهر فى الاهلى بدون شروط"),
                    influentialNews(image: 'images/Influential_2.jpg' , title: 'حسين الشحات يرفض أوروبا مقابل الاهلى'),
                    influentialNews(image: 'images/Influential_3.jpg' , title: 'محمد محمود يوقع للأهلى'),
                    influentialNews(image: 'images/Influential_4.jpg' , title: 'وليد سليمان : الأهلي بيتى الاول'),

                  ]
                ),
              )
            ],
          ),

          //eagle(context)
        ],
      ),
    );
  }


  influentialNews({String image , String title}){
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/150,) ,
      child: Container(
        height: MediaQuery.of(context).size.height/3,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(image , fit: BoxFit.fitWidth,),
            ),
            Container(color: Colors.black26,),
            Positioned(
              bottom: 0,
              right: 5,
              child: Text(title ,textDirection: TextDirection.rtl,
                style: myTextStyle(context ,  family: 'Amiri', clr: Colors.yellow[700] , ratioSize: 25).copyWith(
                  shadows: [Shadow(color: Colors.black , blurRadius: 5)] , ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatefulWidget {
  @override
  String imageNews;
  _NewsCardState createState() => _NewsCardState(imageNews);

  NewsCard(this.imageNews);
}
class _NewsCardState extends State<NewsCard> {
  @override

  bool isSaved = false ;
  String imageNews ;
  _NewsCardState(this.imageNews);

  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate.fixed(
              [
                Column(
                  children: <Widget>[
                    Image.asset(imageNews ,
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.height/3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          onPressed: (){
                            setState(() {
                              isSaved==false ? isSaved=true : isSaved=false;
                            });
                            isSaved==false ? undoSnackBar() :
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
                                    child: Icon(
                                      Icons.thumb_up,
                                      color: Colors.lightBlueAccent ,
                                    ),
                                  ),
                                  Text(isSaved==true ?  'Saved a News' : 'Un Saved' ,),
                                ],
                              ),
                              action: SnackBarAction(
                                label: 'Undo',
                                textColor: Colors.orange,
                                onPressed: (){
                                  setState(() {
                                    isSaved==false ? isSaved=true : isSaved=false;
                                  });
                                  undoSnackBar();
                                },
                              ),
                            ));
                          },
                          icon: Icon(
                            isSaved==false ?  Icons.bookmark_border : Icons.bookmark,
                            color: isSaved==false ? null : Colors.lightBlueAccent,
                            size: MediaQuery.of(context).size.width/17,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.share ,size:MediaQuery.of(context).size.width/17,),
                          onPressed: (){
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                color: Colors.black54,
                                height: MediaQuery.of(context).size.height/5,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      right: 0,
                                      child: Transform.translate(
                                        offset: Offset(0, -MediaQuery.of(context).size.width/30),
                                        child: FloatingActionButton(
                                          onPressed: ()=>Navigator.pop(context),
                                          child: Icon(Icons.keyboard_arrow_down),
                                          backgroundColor: Colors.white24,
                                        ),
                                      ),
                                    ),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text("Share With : ",style: TextStyle(color: Colors.grey[200])),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: <Widget>[
                                              shareWith('Facebook' , image: 'images/Facebook_logo.png',),
                                              shareWith('Gmail' , image: 'images/logo_Gmail.png',),
                                              shareWith('Google Drive' , image: 'images/logo_Google_Drive.png',),
                                              shareWith('Instagram' , image: 'images/logo_Instagram.png',),
                                              shareWith('Messenger' , image: 'images/logo_Messenger.png',),
                                              shareWith('Twitter' , image: 'images/logo_Twitter.png',),
                                              shareWith('WhatsApp' , image: 'images/logo_WhatsApp.png',),
                                              shareWith('Massege' , icon: Icons.mail_outline),
                                              shareWith('Bluetooth' , icon: Icons.bluetooth),
                                              shareWith('Copy to Clipboard' , icon: Icons.content_copy),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ]
          ),
        )
      ],
    );
  }

  shareWith(title ,{ image , IconData icon }){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            child: icon==null ?
                  Image.asset(image , width: MediaQuery.of(context).size.width/10,height: MediaQuery.of(context).size.width/10,fit: BoxFit.cover,)
                : Icon(icon , size: MediaQuery.of(context).size.width/12,),
            backgroundColor: Colors.black45,
            radius: MediaQuery.of(context).size.width/14,
          ),
          Text(title,style: TextStyle(color: Colors.grey[200]),)
        ],
      ),
    );
  }

  undoSnackBar(){
    return Scaffold.of(context).showSnackBar(SnackBar(
      content: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
            child: Icon(
              Icons.thumb_down ,
              color: Colors.red[800],
            ),
          ),
          Text('Un Saved'),
        ],
      ),
    ));
  }
}


