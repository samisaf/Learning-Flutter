import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'firebase_options.dart';
import 'dice_svg.dart';
import 'board_svg.dart';

const String introduction =
    "هذا هو التطبيق الأول الذي يسمح للمستخدمين برمي النرد إلكترونيًا بواجهة عربية فصحية";

const List<String> numbersEnglish = [
  "Zero",
  "One",
  "Two",
  "Three",
  "Four",
  "Five",
  "Six",
];
const List<String> numbersArabic = [
  "صفر",
  "واحد",
  "اثنان",
  "ثلاثة",
  "أربعة",
  "خمسة",
  "ستة",
];

const String title = "اِرمِ حَجَرَ النَّردِ";

const String luckyYou = "أنتَ إنسانٌ مَحظُوظٌ!";
final String copyright = '© ${DateTime.now().year} سامي صفدي ';

// Generates a number from 1 to 6
final random = Random();
int diceRoll() => random.nextInt(6) + 1;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Force the app to run in portrait mode only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

Widget TextKufi(String text, {double fontSize = 30}) {
  return Text(
    text,
    style: TextStyle(fontFamily: 'ReemKufi', fontSize: fontSize),
    textDirection: TextDirection.rtl,
    textAlign: TextAlign.center,
  );
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
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TextKufi(widget.title),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(child: TextKufi(copyright, fontSize: 18)),
            ),
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
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextKufi(introduction, fontSize: 24),
                ),
                // SizedBox(width: 10,),
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
                    TextKufi(numbersArabic[_firstDie]),
                    TextKufi(numbersArabic[_secondDie]),
                  ],
                ),
                TextKufi(_firstDie == _secondDie ? luckyYou : ""),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _rollDice,
        tooltip: 'Roll',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
