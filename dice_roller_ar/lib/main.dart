import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'dart:math';
import 'dice_svg.dart';

import 'board_svg.dart';

const title = "اِرمِ حَجَرَ النَّرْدِ";
const numbersEnglish = ["Zero", "One", "Two", "Three", "Four", "Five", "Six"];
const numbersArabic = ["صفر", "واحد", "اثنان", "ثلاثة", "أربعة", "خمسة", "ستة"];
const introduction =
    "هذا هو التطبيق العربي الأول الذي يسمح للمستخدمين في العالم برمي النرد إلكترونيًا بواجهة عربية فصحية";

final random = Random();
int diceRoll() => random.nextInt(6) + 1; // Generates a number from 1 to 6

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // 👈 This is the fix

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      home: const MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _firstDie = diceRoll();
  int _secondDie = diceRoll();

  void _rollDice() {
    setState(() {
      _firstDie = diceRoll();
      _secondDie = diceRoll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: 'ReemKufi', fontSize: 30.0),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: SvgPicture.string(
                  backgammonBoardPortrait,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    introduction,
                    style: TextStyle(fontFamily: 'ReemKufi', fontSize: 20.0),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() => _firstDie = diceRoll());
                      },
                      child: SvgPicture.string(
                        dice[_firstDie],
                        semanticsLabel: 'Dice',
                        width: 150,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _secondDie = diceRoll());
                      },
                      child: SvgPicture.string(
                        dice[_secondDie],
                        semanticsLabel: 'Dice',
                        width: 150,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      numbersArabic[_firstDie],
                      style: TextStyle(fontFamily: 'ReemKufi', fontSize: 30.0),
                    ),
                    Text(
                      numbersArabic[_secondDie],
                      style: TextStyle(fontFamily: 'ReemKufi', fontSize: 30.0),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Text(numbersEnglish[_die_a], style: TextStyle(fontFamily: 'ReemKufi', fontSize: 30.0)),
                //     Text(numbersEnglish[_die_b], style: TextStyle(fontFamily: 'ReemKufi', fontSize: 30.0)),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _rollDice,
        tooltip: 'Roll',
        child: const Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
