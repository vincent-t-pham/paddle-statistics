import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  SocialMedia({Key? key}) : super(key: key);

  List socials = ["Instagram", "Facebook", "Twitter", "Snapchat"];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Team Info',
            style: TextStyle(
                fontSize: 30,
                color: Colors.deepPurple,
                fontFamily: 'Libre Baskerville'),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Text(
            "SOCIAL MEDIA",
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Libre Baskerville'),
          ),
          SizedBox(height: 45),
          ...socials.map((e) => labelTextField(e))
        ],
      ),
    );
  }
}

Widget labelTextField(e) {
  return Container(

      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 10,),
        Text(e),
        Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                contentPadding: EdgeInsets.only(left: 10.0),
                border: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none
          //borderSide: const BorderSide(),
        ),
              ),
            )
        )

      ]));
}
