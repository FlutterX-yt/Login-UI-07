import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
                  child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff06beb6), Color(0xff48b1bf)])),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Stack(
                  children: [
                    ClipPath(
                      clipper: DrawClip(),
                      child: Container(
                        height: 560,
                        width: size.width - 50,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      child: Container(
                        child: Image.network(
                            'https://i.postimg.cc/q784Qn4m/playstation-2.png'),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 110,
                      child: Text(
                        "Login",
                        style: GoogleFonts.montserrat(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                color: Colors.grey.shade500,
                                offset: Offset(3.0, 3.0),
                                blurRadius: 3.0,
                              ),
                              Shadow(
                                color: Colors.white,
                                offset: Offset(-3.0, 3.0),
                                blurRadius: 3.0,
                              ),
                            ]),
                      ),
                    ),
                    input("Email", false),
                    input("Password", true),
                    Positioned(
                      right: 30,
                      top: 380,
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff06beb6),
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-3.0, -3.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0)
                            ],
                            color: Color(0xff06beb6)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      child: Transform.rotate(
                        angle: pi / 6.4,
                        child: Container(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              
                              social('https://i.postimg.cc/HxFdTLVG/google-plus.png'),
                              social('https://i.postimg.cc/0y4tWK3q/facebook-2.png'),
                              social('https://i.postimg.cc/GpsXZhwT/twitter-3.png'),
                              social('https://i.postimg.cc/7YYmqNrk/linkedin.png'),
                              ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 80,),
                Text("New User?",style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                ),),
                SizedBox(height: 5,),
                Text("SIGNUP",style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget social(String url) {
  return Material(
    borderRadius: BorderRadius.circular(8),
    elevation: 10,
    child: Padding(
        padding: EdgeInsets.all(8),
        child: Image.network(
          url,
          width: 28,
          height: 28,
        )),
  );
}

Widget input(String name, bool pass) {
  return Positioned(
    left: 10,
    top: pass ? 290 : 210,
    child: Material(
      elevation: 10,
      child: Container(
        width: 320,
        child: TextFormField(
            decoration: InputDecoration(
                fillColor: Color(0xff06bdb6).withOpacity(0.2),
                filled: true,
                labelText: name,
                labelStyle: GoogleFonts.montserrat(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                prefixIcon: pass
                    ? Icon(Icons.lock_outline_sharp, color: Color(0xff06beb6))
                    : Icon(
                        Icons.email,
                        color: Color(0xff06beb6),
                      ),
                border: UnderlineInputBorder(borderSide: BorderSide.none))),
      ),
    ),
  );
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 50);
    path.quadraticBezierTo(0, 0, 50, 30);
    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, size.height - 50);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 50, size.height - 30);
    path.lineTo(0, size.height * 2 / 3);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
