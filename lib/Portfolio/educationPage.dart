// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "MY EDUCATION",
            style: TextStyle(
              fontFamily: "Comfortaa",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.university),
                      iconSize: 80,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Daffodil International University",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 27,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Bachelor of Science in Computer Science and Engineering\n"
                      "(2021-2025)\n\n"
                      "Pursuing my undergraduate degree with a focus on product development and deployment in distributed systems. I am dedicated to leveraging my skills to create innovative and impactful solutions.",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 17,
                        color: Colors.white70,
                        letterSpacing: 1.5,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.building),
                      iconSize: 80,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Khulna Govt. Girls' College",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 27,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Higher Secondary Certificate in Science\n"
                      "(2017-2019)\n\n"
                      "Completed my higher secondary education with a major in Science, excelling academically and actively participating in extracurricular activities.",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 17,
                        color: Colors.white70,
                        letterSpacing: 1.5,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.school),
                      iconSize: 80,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Hazi Faiz Uddin Girls High School",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 27,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Primary and Secondary Education\n"
                      "(2013-2017)\n\n"
                      "Graduated with top honors, consistently achieving high academic performance and demonstrating leadership in school activities.",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 17,
                        color: Colors.white70,
                        letterSpacing: 1.5,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
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
      ),
    );
  }
}

void main() => runApp(const EducationPage());
