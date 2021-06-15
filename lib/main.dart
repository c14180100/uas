import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'RecipeAPI.dart';

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
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.05,
                        ),
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.05,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(29, 41, 54, 0.5),
                                Colors.blue.withOpacity(0.5)
                              ]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userData[index]['name'],
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[50],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            Text(
                              userData[index]['email'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.red[50],
                              ),
                            ),
                            // Text(DateTime.fromMicrosecondsSinceEpoch(tanggal.seconds * 1000000)
                            //     .toString()),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
