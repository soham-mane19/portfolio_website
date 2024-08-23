import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  int pageindex = 0;
  int? conindex;
  ScrollController scrollController = ScrollController();
  void scrollToSection(double postion) {
    scrollController.animateTo(postion,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void scrollListener() {
    double scrollPosition = scrollController.position.pixels;
    double screenWidth = MediaQuery.of(context).size.width;

    if (scrollPosition < (screenWidth > 600 ? 300 : 200)) {
      setState(() {
        pageindex = 0;
      });
    } else if (scrollPosition >= (screenWidth > 600 ? 500 : 400) &&
        scrollPosition < (screenWidth > 600 ? 600 : 1600)) {
      setState(() {
        pageindex = 1;
      });
    } else if (scrollPosition >= (screenWidth > 600 ? 1000 : 1800) &&
        scrollPosition < (screenWidth > 600 ? 1200 : 1850)) {
      setState(() {
        pageindex = 2;
      });
    } else if (scrollPosition >= (screenWidth > 600 ? 1300 : 1950)) {
      setState(() {
        pageindex = 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double avatarRadius;
    if (screenWidth > 1200) {
      avatarRadius = 130;
    } else if (screenWidth > 600) {
      avatarRadius = 80;
    } else {
      avatarRadius = 60;
    }

    double avatarImageSize = avatarRadius * 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PortFolio",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            button('Home', 0),
            button('Portfolio', 1),
            button('About', 2),
            button('Contact', 3),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 20, top: 10),
        child: ListView(
          controller: scrollController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi there!",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth > 600 ? 48 : 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "I'm",
                                    style: GoogleFonts.poppins(
                                        fontSize: screenWidth > 600 ? 48 : 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                                TextSpan(
                                    text: " Soham Mane",
                                    style: GoogleFonts.poppins(
                                        fontSize: screenWidth > 600 ? 48 : 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.orange)),
                              ])),
                          SizedBox(height: 20),
                          Align(
                              alignment: Alignment.center,
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'a ',
                                          style: GoogleFonts.poppins(
                                              fontSize:
                                                  screenWidth > 600 ? 26 : 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      TextSpan(
                                          text: 'Flutter developer',
                                          style: GoogleFonts.poppins(
                                              fontSize:
                                                  screenWidth > 600 ? 26 : 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blue)),
                                      TextSpan(
                                          text:
                                              ' passionate about crafting beautiful, high-performance apps.',
                                          style: GoogleFonts.poppins(
                                              fontSize:
                                                  screenWidth > 600 ? 26 : 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                    ],
                                  ))),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/photo.jpeg',
                          fit: BoxFit.cover,
                          width: avatarImageSize,
                          height: avatarImageSize,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.yellow),
                        minimumSize: WidgetStatePropertyAll(Size(
                          screenWidth > 600 ? 200 : 130,
                          screenWidth > 600 ? 60 : 40,
                        ))),
                    onPressed: () {
                    html.window.open(
                      'https://drive.google.com/uc?export=download&id=1RM8b4Aubo4FRBXzpW64zYMTLDOQqflg1',
                      'CV Download',
                    );
                  },
                    child: Text("Download CV",
                        style: GoogleFonts.poppins(
                            fontSize: screenWidth > 600 ? 26 : 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    contactButton('assets/linkedin.png', 0,
                        'https://www.linkedin.com/in/soham-mane-06591920b/'),
                    const SizedBox(
                      width: 20,
                    ),
                    contactButton('assets/github.png', 1,
                        'https://github.com/soham-mane19'),
                    const SizedBox(
                      width: 20,
                    ),
                    contactButton('assets/twitter.png', 2,
                        'https://x.com/i/flow/login?redirect_after_login=%2FSohamMane1910'),
                    const SizedBox(
                      width: 20,
                    ),
                    contactButton('assets/instagram.png', 3,
                        'https://www.instagram.com/soham_mane19/?igsh=NjVweDBqdmJ3NHdi'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 40),
                Text(
                  "Skills",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    skillChip("Flutter"),
                    skillChip("Dart"),
                    skillChip("Firebase"),
                    skillChip("UI/UX Design"),
                    skillChip("GitHub"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 40),
                Text(
                  "Projects",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                GridView.count(
                  crossAxisCount: screenWidth > 600 ? 3 : 1,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    projectCard(
                        'Wallet App',
                        'A secure and user-friendly wallet app for managing digital currencies.',
                        'https://www.linkedin.com/feed/update/urn:li:activity:7221911358433333248/',
                        'assets/walletover.png'),
                    projectCard(
                        'Music App',
                        'A UI design for a music streaming app, showcasing modern interface and usability.',
                        'https://www.linkedin.com/in/soham-mane-06591920b/recent-activity/all/',
                        'assets/music.png'),
                    projectCard(
                        'Bicycle App',
                        'An app designed for managing bicycle rentals, including features for booking, tracking, and user management.',
                        'https://www.linkedin.com/in/soham-mane-06591920b/recent-activity/all/',
                        'assets/bicycle.png'),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  "About Me",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "I am a passionate Flutter developer with a strong background in designing and developing high-performance mobile applications. My journey in tech began with a fascination for building solutions that blend creativity with functionality. Over the years, I've honed my skills in Flutter and Dart, and have worked on diverse projects ranging from user-friendly apps to complex systems.",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth > 600 ? 18 : 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "My expertise lies in crafting intuitive user interfaces, integrating with backend systems, and ensuring the overall performance of the apps. I thrive in collaborative environments and am always eager to learn and adopt new technologies to stay at the forefront of app development.",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth > 600 ? 18 : 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "When I'm not coding, you'll find me exploring new tech trends, working on personal projects, or enjoying outdoor activities. I am dedicated to delivering exceptional digital experiences and look forward to taking on new challenges and opportunities in the tech world.",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth > 600 ? 18 : 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Get in Touch",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Your Name',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Your Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Your Message',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Send Message",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Divider(color: Colors.white54),
                const SizedBox(height: 20),
                Text(
                  "© 2024 Soham Mane. All Rights Reserved.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget projectCard(
      String title, String description, String url, String imageurl) {
    return GestureDetector(
     onTap: () {
                  html.window.open(url, 'blank');
                },
      child: Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Center(
                child: SizedBox(
                  height: 320,
                  child: Image.network(imageurl,
                      fit: BoxFit.contain, width: double.infinity),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget skillChip(String skill) {
    return Chip(
      label: Text(
        skill,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  Widget contactButton(String image, int index, String url) {
    return GestureDetector(
      onTap: () {
        setState(() {
          conindex = index;
        });
        if (conindex == index) {
         
          html.window.open(url, 'blank');
        }
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(101, 255, 255, 255),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      ),
    );
  }

  Widget button(String name, int index) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              pageindex = index;
              if (index == 0) {
                scrollTohome();
              } else if (index == 1) {
                scrollToPortfolio();
              } else if (index == 2) {
                scrollToAboutMe();
              } else if (index == 3) {
                scrollToContact();
              }
            });
          },
          child: Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
        pageindex == index
            ? Container(
                height: 2,
                width: 50,
                color: Colors.white,
              )
            : Container(),
      ],
    );
  }

  void scrollToPortfolio() {
    double screenWidth = MediaQuery.of(context).size.width;
    double position = screenWidth > 600 ? 600 : 510;
    scrollToSection(position);
  }

  void scrollToAboutMe() {
    double screenWidth = MediaQuery.of(context).size.width;
    double position = screenWidth > 600 ? 1100 : 1980;

    scrollToSection(position);
  }

  void scrollToContact() {
    double screenWidth = MediaQuery.of(context).size.width;
    double position = screenWidth > 600 ? 2100 : 2400;
    scrollToSection(position);
  }

  void scrollTohome() {
    double postion = 0;
    scrollToSection(postion);
  }
}
