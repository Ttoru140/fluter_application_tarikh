import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quran/t/tafsir_models.dart';
import 'dart:convert';

class AyahViewScreen extends StatefulWidget {
  final int surahNumber;

  AyahViewScreen({required this.surahNumber});

  @override
  _AyahViewScreenState createState() => _AyahViewScreenState();
}

class _AyahViewScreenState extends State<AyahViewScreen> {
  List<Ayah> ayahs = [];

  Future<void> fetchAyahs() async {
    final url =
        'https://cdn.jsdelivr.net/gh/spa5k/tafsir_api@main/tafsir/en-ibn-kathir/${widget.surahNumber}.json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        ayahs = TafsirResponse.fromJson(data).ayahs;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAyahs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ayahs of Surah ${widget.surahNumber}')),
      body: ayahs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: ayahs.length,
              itemBuilder: (context, index) {
                final ayah = ayahs[index];
                return ListTile(
                  title: Text('Ayah ${ayah.number}'),
                  subtitle: Text(ayah.text),
                );
              },
            ),
    );
  }
}
