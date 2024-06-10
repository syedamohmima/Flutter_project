import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "ABOUT ME",
            style: TextStyle(
              fontFamily: "Comfortaa",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueGrey, Colors.black87],
              ),
            ),
            child: Column(
              children: <Widget>[
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("images/profile.jpg"), // Update with your image path
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "About Me",
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "Hello! I'm Syeda Mohmima, a passionate developer and designer. I specialize in creating innovative solutions and have a keen interest in learning new technologies. My journey in the tech world has been driven by my curiosity and desire to solve real-world problems.",
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Skills",
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: <Widget>[
                      Chip(
                        label: const Text('Flutter'),
                        backgroundColor: Colors.blueAccent,
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      Chip(
                        label: const Text('Dart'),
                        backgroundColor: Colors.greenAccent,
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      Chip(
                        label: const Text('JavaScript'),
                        backgroundColor: Colors.orangeAccent,
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      Chip(
                        label: const Text('React'),
                        backgroundColor: Colors.purpleAccent,
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      Chip(
                        label: const Text('UI/UX Design'),
                        backgroundColor: Colors.redAccent,
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Experience",
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "I have worked on various projects ranging from mobile app development to web applications. My experience includes collaborating with cross-functional teams to deliver high-quality products that meet user needs.",
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Contact",
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.linkedin),
                        color: Colors.blue,
                        iconSize: 30,
                        onPressed: () {
                          // Add LinkedIn URL
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.github),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () {
                          // Add GitHub URL
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.twitter),
                        color: Colors.lightBlue,
                        iconSize: 30,
                        onPressed: () {
                          // Add Twitter URL
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 260,
                  child: Divider(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const AboutMe());
