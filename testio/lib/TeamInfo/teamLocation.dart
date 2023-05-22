import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'teamMembers.dart';

class teamLocation extends StatefulWidget {
  const teamLocation({Key? key}) : super(key: key);

  @override
  State<teamLocation> createState() => teamInformation();
}

class teamInformation extends State<teamLocation> {
  String searchValue = '';
  final List<String> _suggestions = [
    'San Jose',
    'San Francisco',
    'Oakland',
    'Los Angeles',
    'Santa Barbara',
    'Davis',
    'San Diego',
    'Sacremento',
    'Long Beach',
    'Portland',
    'Seattle'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: const Text(
          "Location",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        onSearch: (value) => setState(() {
          searchValue = value;
        }),
        suggestions: _suggestions,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
          ),
          Text(
            'Enter Team Location:',
            style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
                fontFamily: 'Libre Baskerville'),
          ),
          Text(
            'First click at the top right',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 30),
          Text(
            '$searchValue',
            style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
                fontFamily: 'Libre Baskerville'),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeamInfoTeamMembers()));
            },
            child: Text(
              "Save and continue",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(101, 98, 223, 1)),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/teammembers');
            },
            child: Text(
              'Do it later',
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
class teamInformation extends State<teamLocation> {
  String searchValue = '';
  final List<String> _suggestions = ['San Jose'];

  //List fields = ["Instagram", "Facebook", "Twitter", "Snapchat"];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Enter Team Info',
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
            "TEAM LOCATION",
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Libre Baskerville'),
          ),
          SizedBox(height: 35),
          EasySearchBar(
            title: const Text(
              "Location",
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            onSearch: (value) => setState(() {
              searchValue = value;
            }),
            suggestions: _suggestions,
          ),

          //...fields.map((e) => labelTextField(e))
        ],
      ),
    );
  }
}
*/

Widget labelTextField(e) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
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
            ))
      ]));
}
