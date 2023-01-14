import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './about_me.dart';
import '../crud/edit.dart';
import '../crud/tambah.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _listdata = [];
  bool _isLoading = true;

  Future _getdata() async {
    try {
      final response = await http.get(
        Uri.parse("http://192.168.43.135/flutter/crud/read.php"),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
          _isLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _hapus(String id) async {
    try {
      final response = await http.post(
          Uri.parse("http://192.168.43.135/flutter/crud/hapus.php"),
          body: {
            "nik": id,
          });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Data Dosen UPJ",
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              color: Colors.blue,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Menu Pilihan",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              leading: Icon(
                Icons.home,
                size: 35,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => AboutMe(),
                  ),
                );
              },
              leading: Icon(
                Icons.person,
                size: 35,
              ),
              title: Text(
                "About Me",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _listdata.length,
              itemBuilder: ((context, index) {
                return Card(
                  color: Colors.lightGreen,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => EditData(
                                ListData: {
                                  "id": _listdata[index]['id'],
                                  "nik": _listdata[index]['nik'],
                                  "nama": _listdata[index]['nama'],
                                  "gender": _listdata[index]['gender'],
                                  "status_dosen": _listdata[index]
                                      ['status_dosen'],
                                  "mata_kuliah": _listdata[index]
                                      ['mata_kuliah'],
                                  "gambar": _listdata[index]['gambar'],
                                },
                              )),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        child: ClipOval(
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage("images/foto2.png"),
                          ),
                        ),
                      ),
                      title: Text(_listdata[index]['nama']),
                      subtitle: Text(_listdata[index]['mata_kuliah']),
                      textColor: Colors.white,
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: ((context) {
                                  return AlertDialog(
                                    content: Text("Yakin menghapus data?"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            _hapus(_listdata[index]['nik'])
                                                .then((value) {
                                              if (value) {
                                                final snackBar = SnackBar(
                                                  content: const Text(
                                                      'Data Berhasil Hapus'),
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else {
                                                final snackBar = SnackBar(
                                                  content: const Text(
                                                      'Data Gagal Hapus'),
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              }
                                            });
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        HomePage())),
                                                (route) => false);
                                          },
                                          child: Text("Ya")),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Tidak")),
                                    ],
                                  );
                                }));
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  ),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => TambahData()),
              ),
            );
          }),
    );
  }
}
