import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'names_svg.dart';

const title = "سامي الصفدي";
const name =  "Sami Safadi";
final int year = DateTime.now().year;
final String copyright = '\u00A9 ${year.toString()}';

void main() {
  return runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueGrey[300],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.string(
                svgSamiSafadi,
                fit: BoxFit.fitWidth
                // width: 500,
                // height: 500,
              ),
            ),
            Text("$copyright $name\n"),
          ],
        ),
      ),
    );
  }
}