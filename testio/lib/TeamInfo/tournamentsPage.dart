import 'package:flutter/material.dart';


class TournamentsPage extends StatelessWidget {
  TournamentsPage({Key? key}) : super(key: key);
  // const TournamentPage({super.key})
  final List<Tournament> upcomingTournaments = [
    Tournament('SJSU Regatta', DateTime.now().add(Duration(days: 10)),
        'Location A', '5km'),
    Tournament('Long Beach Dragon Boat Festival',
        DateTime.now().add(Duration(days: 20)), 'Location B', '10km'),
    // Add more upcoming tournaments...
  ];

  final List<Tournament> previousTournaments = [
    Tournament('Tempe Arizona Dragon Boat Festival',
        DateTime.now().subtract(Duration(days: 10)), 'Location X', '5km'),
    Tournament('IDBF Thailand Worlds',
        DateTime.now().subtract(Duration(days: 20)), 'Location Y', '10km'),
    Tournament('SF College Cup 2023',
        DateTime.now().subtract(Duration(days: 20)), 'Location Y', '10km'),
    Tournament('Baby Long Beach 2023',
        DateTime.now().subtract(Duration(days: 20)), 'Location Y', '10km'),
    // Add more previous tournaments...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Competitions',
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
                    Expanded(
                    child: ListView(
                        children: [
                        SectionHeader(title: 'Upcoming'),
                        ...upcomingTournaments.map((t) => TournamentCard(tournament: t)),
                        SectionHeader(title: 'Previous'),
                        ...previousTournaments.map((t) => TournamentCard(tournament: t)),
                        ],
                    ),
                    ),
                    ElevatedButton(
                    onPressed: () {
                        Navigator.pushNamed(context, '/attendanceSheet');
                    },
                    child: Text('Attendance Sheet'),
                    ),
                ],
            ),
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
        style: TextStyle(
            fontFamily: 'Libre Baskerville',
            fontSize: 24,
            fontWeight: FontWeight.bold),
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
      onTap: () {
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
                style: TextStyle(
                    fontFamily: 'Libre Baskerville',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text('Date: ${tournament.date.toIso8601String()}',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              Text('Location: ${tournament.location}',
                  style: TextStyle(
                    color: Colors.white,
                  )),
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

  const TournamentDetailsPage({Key? key, required this.tournament})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyHeats = {
      'Heat 1': [
        {'name': 'Racer A1', 'time': '12.34s'},
        {'name': 'Racer A2', 'time': '12.56s'},
        // Add more racers...
      ],
      'Heat 2': [
        {'name': 'Racer B1', 'time': '11.84s'},
        {'name': 'Racer B2', 'time': '12.23s'},
        // Add more racers...
      ],
      // Add more heats...
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tournament.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Libre Baskerville',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Participants',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Libre Baskerville',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        backgroundColor: Color.fromRGBO(101, 98, 223, 1),
        toolbarHeight: 90.0,
      ),
      body: ListView.builder(
        itemCount: dummyHeats.length,
        itemBuilder: (context, index) {
          String heatName = dummyHeats.keys.elementAt(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  heatName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ...dummyHeats[heatName]!.map((racer) {
                return Card(
                  child: ListTile(
                    title: Text(racer['name']!),
                    trailing: Text(racer['time']!),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
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
