import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'UserAPI.dart';
import 'postThumbnail.dart';

class ListDetail extends StatefulWidget {
  final String id;
  ListDetail({this.id});

  @override
  _ListDetailState createState() => _ListDetailState(id: id);
}

class _ListDetailState extends State<ListDetail> {
  final String id;
  _ListDetailState({this.id});

  List<Map<String, dynamic>> details = [];

  void getAPI() {
    UserData.connectToAPIDetails("posts").then((value) {
      details = value;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(29, 41, 59, 0.8),
        title: Text(""),
        elevation: 0,
      ),
      body: Container(
        width: double.maxFinite,
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
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return PostThumbnail(details[index]);
                }),
          ),
        ),
      ),
    );
  }
}
