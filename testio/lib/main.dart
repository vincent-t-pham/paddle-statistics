import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          primarySwatch: Colors.deepPurple,
        ),
        routes: {
          // '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
          '/': (context) => TournamentsPage(),
        }
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TournamentsPage extends StatelessWidget {
  TournamentsPage({Key? key}) : super(key: key);

  final List<Tournament> upcomingTournaments = [
    Tournament('Tournament A', DateTime.now().add(Duration(days: 10)), 'Location A', '5km'),
    Tournament('Tournament B', DateTime.now().add(Duration(days: 20)), 'Location B', '10km'),
    // Add more upcoming tournaments...
  ];

  final List<Tournament> previousTournaments = [
    Tournament('Tournament X', DateTime.now().subtract(Duration(days: 10)), 'Location X', '5km'),
    Tournament('Tournament Y', DateTime.now().subtract(Duration(days: 20)), 'Location Y', '10km'),
    Tournament('Tournament Y', DateTime.now().subtract(Duration(days: 20)), 'Location Y', '10km'),
    Tournament('Tournament Y', DateTime.now().subtract(Duration(days: 20)), 'Location Y', '10km'),
    // Add more previous tournaments...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text('Competitions',
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
        body: Center(
          child: ListView(
            children: [
              SectionHeader(title: 'Upcoming'),
              ...upcomingTournaments.map((t) => TournamentCard(tournament: t)),
              SectionHeader(title: 'Previous'),
              ...previousTournaments.map((t) => TournamentCard(tournament: t)),
            ],
          ),
        )
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontFamily: 'Libre Baskerville',fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TournamentCard extends StatelessWidget {
  final Tournament tournament;

  const TournamentCard({Key? key, required this.tournament}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TournamentDetailsPage(tournament: tournament),
          ),
        );
      },
      child: Card(
        color: Color.fromRGBO(101, 98, 223, 1),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tournament.name,
                style: TextStyle(fontFamily: 'Libre Baskerville', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                  'Date: ${tournament.date.toIso8601String()}',
                  style: TextStyle(color: Colors.white,)
              ),
              Text(
                  'Location: ${tournament.location}',
                  style: TextStyle(color: Colors.white,)
              ),
              Text(
                'Race Distance: ${tournament.raceDistance}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TournamentDetailsPage extends StatelessWidget {
  final Tournament tournament;

  const TournamentDetailsPage({Key? key, required this.tournament}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tournament.name),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //how does <Widget> work, maybe an insert?
              children: <Widget>[
                Text(
                  'Here are the race results for ${tournament.name}:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            )
        )
    );
  }
}

class Tournament {
  final String name;
  final DateTime date;
  final String location;
  final String raceDistance;

  Tournament(this.name, this.date, this.location, this.raceDistance);
}


