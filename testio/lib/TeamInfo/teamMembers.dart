import 'package:flutter/material.dart';
import 'nameTile.dart';

class TeamInfoTeamMembers extends StatefulWidget {
  @override
  State<TeamInfoTeamMembers> createState() => _TeamInfoTeamMembers();
}

class _TeamInfoTeamMembers extends State<TeamInfoTeamMembers> {
  List members = [];
  final TextEditingController myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void addMember(String mem) {
    setState(() {
      members.add(mem);
    });
  }

  void deleteMem(int index) {
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
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              SizedBox(height: 10),
              Text(
                "TEAM MEMBERS",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: 'Libre Baskerville'),
              ),
              SizedBox(height: 45),
              searchBar(members, addMember, myController),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20),
                  ),
                  ...members.map((e) {
                    var i = members.indexOf(e);
                    return nameTile(e, () => deleteMem(i));
                  }),
                ],
              )),
              nextPageButton(context),
            ])));
  }
}

Widget searchBar(members, addMem, cont) {
  return Container(
      child: TextField(
    maxLength: 40,
    controller: cont,
    decoration: InputDecoration(
        fillColor: Colors.grey.shade300,
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(
            Icons.add_circle_outline,
            color: Colors.black,
          ),
          onPressed: (() {
            if (cont.text.replaceAll(' ', '').length != 0) {
              addMem(cont.text.trim());
              cont.text = "";
            }
          }),
        ),
        contentPadding: EdgeInsets.only(left: 10, top: 15),
        border: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
        hintText: "Team Members",
        hintStyle: TextStyle(color: Colors.grey)),
  ));
}

Widget nextPageButton(context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(101, 98, 223, 1)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/awards');
              },
              child: Text('Save and Continue'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/awards');
                },
                child: Text(
                  'Do it later',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            )
          ],
        )),
  );
}
