
import 'package:alAhlySC/News.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Static_Variables.dart';

import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';


class Login_page extends StatefulWidget {

  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {

  String nameRegister;
  bool visiblePass = true;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          _background(),
          /*Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black12,
          ),*/

          Align(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(0,MediaQuery.of(context).size.height/10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow:[BoxShadow(blurRadius: 10)]
                    ),
                    width: MediaQuery.of(context).size.width *0.8,
                    height: MediaQuery.of(context).size.height*0.5,
                    child: _fieldes(),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.width/25,),

                  Text('Dont have an account ?' ,  style: myTextStyle(context ,family: null, clr: null).copyWith(fontWeight: FontWeight.normal)),
                  Text('REGISTER' , style: myTextStyle(context)),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  _background(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *0.65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          image: DecorationImage(
              image: AssetImage(
                'images/alahly_wallpaper.jpg',
              ),
              fit: BoxFit.cover
          )
      ),
    );
  }

  _fieldes(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Al Ahly SC'.toUpperCase() , style: myTextStyle(context),),
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'UserName',
                errorStyle: TextStyle(fontSize: 15 ),
              ),
              validator: (name){
                print(name);
                setState(() {
                  nameRegister=name;
                });
                if(name.isEmpty){
                  return 'invalid name';
                }return null;
              },
            ),
          ),
        ),

        Form(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              obscureText: visiblePass,
              validator: (password){
                if(password.isEmpty){
                  return 'invalid password';
                }else return null;
              },
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: visiblePass==true? Icon(Icons.visibility_off , color: Colors.red,) : Icon(Icons.visibility ,  color: Colors.red,),
                  onPressed: (){
                    setState(() {
                      visiblePass==true ? visiblePass=false : visiblePass=true;
                    });
                  },
                ),
              ),
            ),
          ),
        ),



        Text('forget password' , style: TextStyle(color: Colors.red),),

        CupertinoButton(
          onPressed: ()async{
            if(formKey.currentState.validate()){
              var  undoResult  = await Navigator.push(context, CupertinoPageRoute(
                builder: (context)=>News(),
                settings: RouteSettings(arguments: nameRegister),
                title: '/News'
              ));
              print(undoResult);
            }
          },
          color: Colors.red[700],
          child: Text('LOG IN', style: TextStyle(color: Colors.white),),
          borderRadius: BorderRadius.circular(20),
        ),
        Text('OR'),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('images/Facebook_logo.png'),
            backgroundColor: Colors.blue[700],
            radius: MediaQuery.of(context).size.width/15,
          ),
            SizedBox(width: MediaQuery.of(context).size.width/25,),
            CircleAvatar(
              backgroundImage: AssetImage('images/google_plus.jpg'),
              radius: MediaQuery.of(context).size.width/15,
            )
          ],
        ),
      ],
    );
  }
}
