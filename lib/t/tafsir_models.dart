class Ayah {
  final int number;
  final String text;

  Ayah({required this.number, required this.text});

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      number: json['number'],
      text: json['text'],
    );
  }
}

class TafsirResponse {
  final List<Ayah> ayahs;

  TafsirResponse({required this.ayahs});

  factory TafsirResponse.fromJson(Map<String, dynamic> json) {
    return TafsirResponse(
      ayahs: List<Ayah>.from(json['ayahs'].map((ayah) => Ayah.fromJson(ayah))),
    );
  }
}
