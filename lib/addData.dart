import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController spesifikasiController = TextEditingController();
  TextEditingController merkController = TextEditingController();

  void addData() {
    var url = Uri.parse("https://api.bamswp.my.id/index.php/barang");

    http.post(url, body: {
      "kode": kodeController.text,
      "nama": namaController.text,
      "harga": hargaController.text,
      "spesifikasi": spesifikasiController.text,
      "merk": merkController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD DATA"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Text(
              "Input Data Barang",
              style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: kodeController,
              decoration: InputDecoration(
                labelText: "Kode",
              ),
            ),
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            TextFormField(
              controller: hargaController,
              decoration: InputDecoration(labelText: "Harga"),
            ),
            TextFormField(
              controller: spesifikasiController,
              decoration: InputDecoration(labelText: "Spek"),
            ),
            TextFormField(
              controller: merkController,
              decoration: InputDecoration(labelText: "Merek"),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                addData();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
