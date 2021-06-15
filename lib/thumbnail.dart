import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas/UserAPI.dart';

import 'ListDetail.dart';

class Thumbnail extends StatelessWidget {
  final Map<String, dynamic> userData;
  Thumbnail(this.userData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String id = userData['id'].toString();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListDetail(
                      id: id,
                    )));
      },
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
              userData['name'],
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[50],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              userData['email'] + " - " + userData['phone'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.red[50],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
