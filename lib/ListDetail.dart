import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'UserAPI.dart';
import 'postThumbnail.dart';

class ListDetail extends StatefulWidget {
  final String id, nama;
  ListDetail(this.id, this.nama);

  @override
  _ListDetailState createState() => _ListDetailState(id, nama);
}

class _ListDetailState extends State<ListDetail> {
  final String id, nama;
  _ListDetailState(this.id, this.nama);

  List<Map<String, dynamic>> details = [];
  List<Map<String, dynamic>> detailsFix = [];

  void getAPI() {
    UserData.connectToAPIDetails("posts").then((value) {
      details = value;
      for (int i = 0; i < details.length; i++) {
        if (details[i]['userId'].toString() == id) {
          detailsFix.add(details[i]);
        }
      }
      setState(() {});
    });
  }

  void asyncAPI() async {
    // ignore: await_only_futures
    await getAPI();
  }

  @override
  // ignore: must_call_super
  void initState() {
    asyncAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(29, 41, 59, 0.8),
        title: Text("Post By " + nama),
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
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    itemCount: detailsFix.length,
                    itemBuilder: (context, index) {
                      return PostThumbnail(detailsFix[index]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
