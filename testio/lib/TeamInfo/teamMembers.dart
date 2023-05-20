import 'package:flutter/material.dart';
import 'nameTile.dart';

class TeamInfoTeamMembers extends StatefulWidget{

  @override
  State<TeamInfoTeamMembers> createState() => _TeamInfoTeamMembers();
}


class _TeamInfoTeamMembers extends State<TeamInfoTeamMembers> {
  List members = [];

  void addMember(String mem){
    setState(() {
      members.add(mem);
    });
  }
  void deleteMem(int index){
    setState(() {
      members.removeAt(index);
    });
  }

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
            searchBar(members,addMember),
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                ),
                ...members.map((e){
                  var i = members.indexOf(e);
                  return nameTile(e, ()=>deleteMem(i));
                })
              ],
            ))
          ]
        )
      )
    );
  }
}

Widget searchBar(members,addMem){
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
        onSubmitted: (e){
          addMem(e);
          e = "";
          },
      )
  );
}