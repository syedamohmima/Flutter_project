import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkExpPage extends StatelessWidget {
  // Function to handle CV upload
  void uploadCV() {
    // Implement the functionality to upload CV here
    // You can use any method to upload the CV, such as launching a file picker or using a file upload API
    // For demonstration purposes, let's print a message
    print('Uploading CV...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MY WORK EXPERIENCE",
          style: TextStyle(
            fontFamily: "Comfortaa",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/workexperience.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  "My work experience include working for startups, communities and"
                  "evolving with innovative business and marketing strategies",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: "Comfortaa",
                    color: Colors.white,
                    letterSpacing: 2.0,
                    height: 2,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.terminal),
                        onPressed: () {},
                        color: Colors.yellow,
                        iconSize: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        "OpenGenus \nFoundation",
                        style: TextStyle(
                          fontFamily: 'Sniglet',
                          fontSize: 24,
                          color: Colors.redAccent,
                          letterSpacing: 2.0,
                          height: 2,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              // Additional work experience content...

              // Button to trigger CV upload
              ElevatedButton(
                onPressed: uploadCV,
                child: Text('Upload CV'),
              ),

              // Blog Section
              SizedBox(height: 20),
              Text(
                'Blog Section',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              BlogPost(
                title: 'My First Blog Post',
                content: 'This is my first blog post. Stay tuned for more!',
              ),
              BlogPost(
                title: 'Another Blog Post',
                content: 'This is another blog post. Exciting stuff!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogPost extends StatelessWidget {
  final String title;
  final String content;

  const BlogPost({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WorkExpPage(),
  ));
}
