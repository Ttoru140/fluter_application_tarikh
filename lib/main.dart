import 'package:flutter/material.dart';
import 'package:quran/t/surah_list.dart';

void main() {
  runApp(TafsirApp());
}

class TafsirApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tafsir Ibn Kathir',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SurahListScreen(),
    );
  }
}
