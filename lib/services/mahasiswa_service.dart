import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mahasiswa.dart';

Future<List<Mahasiswa>> fetchData() async {
  final response =
      await http.get(Uri.parse('http://192.168.131.100:3000/mahasiswa'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data
        .map((json) => Mahasiswa(
              nim: json['nim'],
              nama: json['nama'],
              gender: json['gender'],
              prodi: json['prodi'],
              alamat: json['alamat'],
            ))
        .toList();
  } else {
    throw Exception('Failed to load mahasiswa');
  }
}
