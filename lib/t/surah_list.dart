import 'package:flutter/material.dart';
import 'ayah_view.dart';

class SurahListScreen extends StatelessWidget {
  final List<String> surahs =
      List.generate(114, (index) => 'Surah ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Surah List - Tafsir Ibn Kathir')),
      body: ListView.builder(
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(surahs[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AyahViewScreen(surahNumber: index + 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
