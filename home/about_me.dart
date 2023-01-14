import 'package:flutter/material.dart';
import 'package:uas_andi_nata/home/homepage.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Me"),
        centerTitle: true,
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
      body: Center(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: 200,
                height: 200,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("images/foto77.png"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Nama: Andi Nata",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Program Studi: Sistem Informasi",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Mata Kuliah: Pemograman Mobile Lanjutan",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 200,
                height: 200,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("images/upj.png"),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          );
        },
        child: Icon(Icons.keyboard_arrow_left),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
