import 'package:flutter/material.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/service/place_holder_service.dart';

class InformationDataScreen extends StatefulWidget {
  InformationDataScreen({Key? key}) : super(key: key);

  @override
  _InformationDataScreenState createState() => _InformationDataScreenState();
}

class _InformationDataScreenState extends State<InformationDataScreen> {
  PlaceHolderService _placeHolderService = PlaceHolderService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Crud Operations"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (String id) {},
                decoration: InputDecoration(
                    labelText: ("Kitap ID"),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (String name) {},
                decoration: InputDecoration(
                    labelText: ("Kitap Adı"),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (String category) {},
                decoration: InputDecoration(
                    labelText: ("Kitap Kategorisi"),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (String numberOfPage) {},
                decoration: InputDecoration(
                    labelText: ("Kitap Sayfa Sayısı"),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Ekle"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      onPrimary: Colors.white,
                      shadowColor: Colors.deepOrange,
                      elevation: 4,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Oku"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shadowColor: Colors.blue,
                      elevation: 4,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Güncelle"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shadowColor: Colors.green,
                      elevation: 4,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Sil"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      onPrimary: Colors.white,
                      shadowColor: Colors.purpleAccent,
                      elevation: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
