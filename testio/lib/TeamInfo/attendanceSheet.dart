import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  /*
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _eventPage = TextEditingController();
  */
  List<String> attendanceData = [];

  @override
  void initState() {
    super.initState();
    fetchAttendanceData();
  }

  Future<void> fetchAttendanceData() async {
    // final username = _usernameController.text;
    // final password = _passwordController.text;
    // final eventPage = _eventPage.text;

    try {
      /*
       final response =
          await http.post(
            Uri.parse('http://localhost:8000/testio/attendance'),
            body: json.encode({
              'username': username,
              'password': password,
              'eventPage': eventPage
            })
          ); */

      final response = await http.get(
        Uri.parse('http://localhost:5000/attendance'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          attendanceData = List<String>.from(data);
        });
      } else {
        print('Failed to fetch attendance data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: ListView.builder(
        itemCount: attendanceData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(attendanceData[index]),
          );
        },
      ),
    );
  }
}
