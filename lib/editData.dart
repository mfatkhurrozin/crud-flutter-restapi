import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController kodeController;
  TextEditingController namaController;
  TextEditingController hargaController;
  TextEditingController spesifikasiController;
  TextEditingController merkController;

  void editData() {
    var url = Uri.parse("https://api.bamswp.my.id/index.php/barang");
    http.put(url, body: {
      "kode": kodeController.text,
      "nama": namaController.text,
      "harga": hargaController.text,
      "spesifikasi": spesifikasiController.text,
      "merk": merkController.text,
    });
  }

  void deleteData() {
    var url = Uri.parse("http://api.bamswp.my.id/index.php/mahasiswa");
    http.delete(url, body: {'kode': widget.list[widget.index]['kode']});
  }

  void konfirmasi() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Apakah anda yakin akan menghapus data '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          child: Text(
            "OK DELETE!",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            deleteData();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          child: Text("CANCEL", style: TextStyle(color: Colors.black)),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  @override
  void initState() {
    kodeController =
        TextEditingController(text: widget.list[widget.index]['kode']);
    namaController =
        TextEditingController(text: widget.list[widget.index]['nama']);
    hargaController =
        TextEditingController(text: widget.list[widget.index]['harga']);
    spesifikasiController =
        TextEditingController(text: widget.list[widget.index]['spesifikasi']);
    merkController =
        TextEditingController(text: widget.list[widget.index]['merk']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EDIT DATA"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Text(
              "Ubah Data Mahasiswa",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  onPressed: () {
                    editData();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text("Ubah"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    konfirmasi();
                  },
                  child: Text("Hapus"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
