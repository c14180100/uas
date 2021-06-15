import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas/listDetail.dart';
import 'package:uas/thumbnail.dart';

import 'UserAPI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: avoid_init_to_null
  List<Map<String, dynamic>> userData = [];

  void getAPI() {
    UserData.connectToAPI().then((value) {
      userData = value;
      setState(() {});
    });
  }

  void asyncAPI() async {
    // ignore: await_only_futures
    await getAPI();
  }

  @override
  void initState() {
    asyncAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("backgrounds/bg1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 25,
          ),
          child: Center(
            child: Flexible(
              child: ListView.builder(
                  itemCount: userData.length,
                  itemBuilder: (context, index) {
                    return Thumbnail(userData[index]);
                  }),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
