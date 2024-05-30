import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Xylophone App'),
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

  void playSound(int soundNumber) {
    final player = Audio.load('assets/note$soundNumber.wav');
    player.play();
    player.dispose();
  }

  Expanded buildKey(int soundNumber, Color color) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all(color),
        ),
        onPressed: () { playSound(soundNumber); },
        child: Container(color: color,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            buildKey(1, Colors.red),
            buildKey(2, Colors.orange),
            buildKey(3, Colors.yellow),
            buildKey(4, Colors.green),
            buildKey(5, Colors.teal),
            buildKey(6, Colors.blue),
            buildKey(7, Colors.purple),
          ],
        ),
      )
    );
  }
}