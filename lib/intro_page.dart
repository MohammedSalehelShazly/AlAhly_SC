import 'dart:math';
import 'dart:ui';

import 'package:alAhlySC/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Static_Variables.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with SingleTickerProviderStateMixin{


  /*

  // Create a tab controller
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;

  TabBarView tabBarView ;
  @override
  void initState() {
    super.initState();

    _controller = new TabController(initialIndex: 0, length: 5, vsync: this);
    onChanged = () {

      setState(() {
        _currentIndex = this._controller.index;
        print(_controller.index);
      });
    };

    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      // Set the TabBar view as the body of the Scaffold
        body: new TabBarView(

          // Add tabs as widgets
          children: <Widget>[
            Container(color: Colors.red,),
            Container(color: Colors.yellowAccent,),
            Container(color: Colors.black26,),
            Container(color: Colors.lightBlueAccent,),
            Container(color: Colors.greenAccent,),
          ],
          // set the controller
          controller: _controller,
        ),
        // Set the bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index){
            _controller.index = index;
          },
          fixedColor: Colors.purpleAccent,
          type:BottomNavigationBarType.fixed ,
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? Image.asset("icons/home_1.png")
                  : Image.asset("icons/home_6.png"),
              title: Text("first"),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? Image.asset("icons/home_2.png")
                  : Image.asset("icons/home_7.png"),
              title: Text("second"),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? Image.asset("icons/home_3.png")
                  : Image.asset("icons/home_8.png"),
              title: Text("third"),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? Image.asset("icons/home_4.png")
                  : Image.asset("icons/home_9.png"),
              title: Text("fourth"),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 4
                  ? Image.asset("icons/home_5.png")
                  : Image.asset("icons/home_10.png"),
              title: Text("fifth"),
            )
          ],
        ));
  }
*/



  double boxIndicator ()=> MediaQuery.of(context).size.height*0.06;
  var myTabController;
  VoidCallback myonChanged ;
  int _currentIndex =0;

  Alignment button_alignment ;
  Color button_Color ;
  _alignment(){
    if(_currentIndex == 0 || _currentIndex== 1) {
      setState((){
        button_alignment = Alignment.centerLeft ;
        button_Color = Colors.red[600] ;
        print(_currentIndex);
      });

    } else if(_currentIndex == 0) setState((){
      button_alignment = Alignment.centerRight ;
      button_Color = Colors.yellow ;
      print(_currentIndex);
    });
  }
  @override
  void initState() {
    myTabController = TabController(length: 3  , initialIndex: _currentIndex, vsync: this);
    myonChanged =(){
      setState(() {
        _currentIndex = myTabController.index;
      });
    };
    myTabController.addListener(myonChanged);
    _alignment();
    super.initState();
  }
  @override
  void dispose() {
    myTabController.removeListener(myonChanged);
    myTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.90,
              child: TabBarView(
                controller: myTabController,
                children: <Widget>[
                  screenIntro('images/intro_1.jpg' , 'ع الحلوه والمره معاه'),
                  screenIntro('images/intro_2.jpg' , 'يوم م ابطل أشجع هاكون ميت أكيد'),
                  screenIntro('images/intro_3.jpg' , 'أفريقيا للكبار وأنت الأسطوره'),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                  AnimatedPositioned(
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 1500),
                    left: myTabController.index == 0 || myTabController.index== 1 ? 0 : MediaQuery.of(context).size.width*0.75 ,

                    child: InkWell(
                      onTap: ()=> Navigator.push(context, CupertinoPageRoute(builder: (context)=>Login_page())),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.width*0.25,
                        child: Center(
                          child: Text(myTabController.index == 0 || myTabController.index== 1 ? 'Skip' : 'GO !',
                            style: TextStyle(fontSize: MediaQuery.textScaleFactorOf(context)*20 , ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(myTabController.index == 0 || myTabController.index== 1 ? 0 : 10),
                            right: Radius.circular(myTabController.index == 0 || myTabController.index== 1 ? 10 : 0),
                          ),
                          border: Border.all(width: MediaQuery.of(context).size.height*0.003,),
                          color: myTabController.index == 0 || myTabController.index== 1 ? Color(0xff50A992) : Colors.red ,
                        ),
                        ),
                    ),

      /*ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(myTabController.index == 0 || myTabController.index== 1 ? 0 : 10),
                              right: Radius.circular(myTabController.index == 0 || myTabController.index== 1 ? 10 : 0),
                            ),
                            side: BorderSide(width: MediaQuery.of(context).size.height*0.003,)),
                        child: RaisedButton(
                          onPressed: ()=>Navigator.push(context, CupertinoPageRoute(builder: (context)=>Login_page())),
                          child: Text(myTabController.index == 0 || myTabController.index== 1 ? 'Skip' : 'GO !',
                            style: TextStyle(fontSize: MediaQuery.textScaleFactorOf(context)*20 , color: Colors.white),),
                          color: Colors.transparent//myTabController.index==0 || myTabController.index==1 ? Colors.red[400]: Colors.red[800],
                        ),
                      ),*/
                    ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: boxIndicator()*1.5,
                    height: boxIndicator(),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(child: CircleAvatar(radius: (boxIndicator()/3/1.5),backgroundColor: Colors.red[100],)),
                            Expanded(child: CircleAvatar(radius: (boxIndicator()/3/1.5),backgroundColor: Colors.red[100],)),
                            Expanded(child: CircleAvatar(radius: (boxIndicator()/3/1.5),backgroundColor: Colors.red[100],)),
                          ],
                        ),
                        TabBar(
                          controller: myTabController,
                          tabs: <Widget>[Tab(text: '',), Tab(text: '',), Tab(text: '',)],
                          indicatorWeight: boxIndicator(),
                          indicator: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
  screenIntro(image , title){
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height*0.95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5 , sigmaY: 5),
              child: Container(
                width: MediaQuery.of(context).size.width*0.95,
                height: MediaQuery.textScaleFactorOf(context)*60,
                color: Colors.grey.withOpacity(0.2) ,
                child: Center(
                  child: Text(title ,
                    style: myTextStyle(context,
                        family: 'fonts/Amiri-Bold.ttf', clr: Colors.redAccent[700] , ratioSize: 28 , wantShadow: true).copyWith(shadows: [Shadow(color: Colors.black , blurRadius: 5)]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

