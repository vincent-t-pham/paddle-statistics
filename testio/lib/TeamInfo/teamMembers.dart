import 'package:flutter/material.dart';

class TeamInfoTeamMembers extends StatefulWidget{

  @override
  State<TeamInfoTeamMembers> createState() => _TeamInfoTeamMembers();
}
List members = ["salman bhai", "narendre modi", "barraack obama", "adolf hitler", "thomas shelby","ezio auditore"];
class _TeamInfoTeamMembers extends State<TeamInfoTeamMembers> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text('Team Info',
            style: TextStyle(fontSize: 30,
                color: Colors.deepPurple,
                fontFamily: 'Libre Baskerville'
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:20),
        child: Column(
          children: [
            SizedBox(height: 15),
            Text("Team Members",
              style: TextStyle(fontSize: 15,
                  color: Colors.grey,
                  fontFamily: 'Libre Baskerville'
              ),
            ),
            SizedBox(height: 45),
            searchBar(),
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                ),
                ...members.map((e) => Text(e))
              ],
            ))
          ]
        )
      )
    );
  }
}

Widget searchBar(){
  return Container(
      decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal:10.0),
            border: InputBorder.none,
            hintText: "Team member",
            hintStyle: TextStyle(color: Colors.grey)
        ),
        onChanged: (e)=>{print(e)},
      )
  );
}