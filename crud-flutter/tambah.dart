import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../home/homepage.dart';

class TambahData extends StatefulWidget {
  const TambahData({super.key});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nik = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController status_dosen = TextEditingController();
  TextEditingController mata_kuliah = TextEditingController();
  TextEditingController gambar = TextEditingController();

  Future _simpan() async {
    final response = await http.post(
        Uri.parse(
          "http://192.168.43.135/flutter/crud/create.php",
        ),
        body: {
          "nik": nik.text,
          "nama": nama.text,
          "gender": gender.text,
          "status_dosen": status_dosen.text,
          "mata_kuliah": mata_kuliah.text,
          "gambar": gambar.text,
        });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nik,
                decoration: InputDecoration(
                  hintText: "NIK",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nik tidak boleh kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                  hintText: "Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama tidak boleh kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: gender,
                decoration: InputDecoration(
                  hintText: "Gender",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Gender tidak boleh kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: status_dosen,
                decoration: InputDecoration(
                  hintText: "Status",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Status tidak boleh kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: mata_kuliah,
                decoration: InputDecoration(
                  hintText: "Mata Kuliah",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Mata kuliah tidak boleh kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _simpan().then((value) {
                        if (value) {
                          final snackBar = SnackBar(
                            content: const Text('Data Berhasil Disimpan'),
                            duration: Duration(milliseconds: 1500),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          final snackBar = SnackBar(
                            content: const Text('Data Gagal Disimpan'),
                            duration: Duration(milliseconds: 1500),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: ((context) => HomePage())),
                          (route) => false);
                    }
                  },
                  child: Text("Simpan"))
            ],
          ),
        ),
      ),
    );
  }
}
