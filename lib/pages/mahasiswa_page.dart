import 'package:flutter/material.dart';
import '../models/mahasiswa.dart';
import '../services/mahasiswa_service.dart';

class MahasiswaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Mahasiswa'),
      ),
      body: FutureBuilder<List<Mahasiswa>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data![index].nim),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data![index].nama),
                        Text(snapshot.data![index].gender),
                        Text(snapshot.data![index].prodi),
                        Text(snapshot.data![index].alamat),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
