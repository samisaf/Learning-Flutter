import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My Card'),
            SizedBox(width: 10),
            Icon(Icons.badge_outlined),
          ],
        ),
      ),
      body: ProfileWidget(),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular Avatar
          CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage('./images/profile.jpg'),
          ),
          SvgPicture.string(svgSamiSafadi, height: 100),
          SizedBox(height: 20, width: 200, child: Divider(color: Colors.grey)),
          MyBox(text: "Sami Safadi", fontFamily: "Pacifico"),
          SizedBox(height: 20),
          MyBox(text: "سامي صفدي", fontFamily: "Amiri"),
        ],
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  final String text;
  final String fontFamily;

  const MyBox({super.key, required this.text, required this.fontFamily});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
