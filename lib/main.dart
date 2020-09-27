import 'package:alAhlySC/Provider.dart';
import 'package:alAhlySC/intro_page.dart';
import 'package:alAhlySC/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.red[900]);
    //SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red[900],
    ));

    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]); //=> show bottom buttons
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);  //=> show statusBar
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values); //=> show both


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=>MyProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Al Ahly SC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          cursorColor: Colors.red[700]
        ),
        home: IntroPage(),
      ),
    );
  }
}
//Color statusbarColor;

