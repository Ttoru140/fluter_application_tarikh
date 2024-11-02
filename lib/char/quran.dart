import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(QuranApp());
}

class QuranApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SurahListScreen(),
    );
  }
}

class SurahListScreen extends StatefulWidget {
  @override
  _SurahListScreenState createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  List<dynamic> surahList = [];

  @override
  void initState() {
    super.initState();
    fetchSurahs();
  }

  Future<void> fetchSurahs() async {
    final response =
        await http.get(Uri.parse('https://api.alquran.cloud/v1/surah'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        surahList = data['data'];
      });
    } else {
      throw Exception('Failed to load Surahs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quran Surahs'),
      ),
      body: surahList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: surahList.length,
              itemBuilder: (context, index) {
                final surah = surahList[index];
                return ListTile(
                  title: Text(surah['englishName']),
                  subtitle:
                      Text('Surah ${surah['name']} - ${surah['ayahs']} Ayahs'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurahDetailScreen(
                          surahNumber: surah['number'],
                          surahName: surah['englishName'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class SurahDetailScreen extends StatefulWidget {
  final int surahNumber;
  final String surahName;

  SurahDetailScreen({required this.surahNumber, required this.surahName});

  @override
  _SurahDetailScreenState createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  List<dynamic> ayahList = [];
  late AudioPlayer audioPlayer;
  int? playingAyahIndex;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    fetchAyahs();
  }

  Future<void> fetchAyahs() async {
    final response = await http.get(
        Uri.parse('https://api.alquran.cloud/v1/surah/${widget.surahNumber}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        ayahList = data['data']['ayahs'];
      });
    } else {
      throw Exception('Failed to load Ayahs');
    }
  }

  void playAyahAudio(int index) async {
    final ayah = ayahList[index];
    final audioUrl =
        'https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/${ayah['number']}';

    try {
      await audioPlayer.setSourceUrl(audioUrl); // Set the audio source
      await audioPlayer.resume(); // Play the audio
      setState(() {
        playingAyahIndex = index;
      });
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  void stopAudio() async {
    await audioPlayer.pause();
    setState(() {
      playingAyahIndex = null;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surahName),
      ),
      body: ayahList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: ayahList.length,
              itemBuilder: (context, index) {
                final ayah = ayahList[index];
                return ListTile(
                  title: Text('${ayah['numberInSurah']}. ${ayah['text']}'),
                  trailing: IconButton(
                    icon: Icon(
                      playingAyahIndex == index ? Icons.stop : Icons.play_arrow,
                    ),
                    onPressed: () {
                      if (playingAyahIndex == index) {
                        stopAudio();
                      } else {
                        playAyahAudio(index);
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
