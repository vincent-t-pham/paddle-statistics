import 'package:flutter/material.dart';
import 'teamLocation.dart';

class createAccount extends StatelessWidget {
  createAccount({Key? key}) : super(key: key);

  final TextEditingController _text = TextEditingController();
  bool _validate = false;

  void signUpUser() {}

  List socials = ["TEAM NAME", "EMAIL", "PASSWORD"];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'CREATE ACCOUNT',
            style: TextStyle(
                fontSize: 20,
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
            "ENTER ACCOUNT INFORMATION HERE",
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Libre Baskerville'),
          ),
          SizedBox(height: 45),
          ...socials.map((e) => labelTextField(e)),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => teamLocation()));
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}

Widget labelTextField(e) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        Text(
          e,
          style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontFamily: 'Libre Baskerville'),
        ),
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
            ))
      ]));
}
