import 'package:flutter/material.dart';
import 'package:test1/TeamInfo/createAccount.dart';
import 'TeamInfo/teamLocation.dart';
import 'TeamInfo/teamMembers.dart';
import 'TeamInfo/awardsRecieved.dart';
import 'TeamInfo/socialMedia.dart';
import 'TeamInfo/tournamentsPage.dart';
import 'TeamInfo/attendanceSheet.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // primarySwatch: Colors.deepPurple,
          primaryColor: Color.fromRGBO(101, 98, 223, 1),
          hintColor: Color.fromRGBO(101, 98, 223, 1),
          focusColor: Color.fromRGBO(101, 98, 223, 1),
        ),
        routes: {
          // '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
          '/': (context) => createAccount(),
          //'/': (context) => TournamentsPage(),
          '/teammembers': (context) => TeamInfoTeamMembers(),
          '/awards': (context) => TeamInfoAwards(),
          '/socialmedia': (context) => SocialMedia(),
          '/tournaments': (context) => TournamentsPage(),
          '/attendanceSheet': (context) => AttendanceScreen(),

        }
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

