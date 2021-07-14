import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';




class InformationDataScreen extends StatefulWidget {
  @override
  _InformationDataScreenState createState() => _InformationDataScreenState();
}
String randomImage= 'https://saskatoonavionics.ca/wp-content/uploads/2020/01/test.png';
class _InformationDataScreenState extends State<InformationDataScreen> {
  File _selectedImage = File(randomImage);
  final productIdController = TextEditingController();
  final productNameController = TextEditingController();
  final productCategoryController = TextEditingController();
  final productUnitsInStockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xFFB71C1C),
          title: Text("Product Profile"),
        ),
        body: Builder(
            builder: (context) =>
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    child: _selectedImage == null ? Text("FOTOĞRAF") : null,
                                    radius: 80,
                                    backgroundImage:
                                    _selectedImage != null ? FileImage(_selectedImage) : null,

                                  )
                              ),

                              Padding(padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  onPressed: () {
                                    _showImage(context);
                                  }, icon: Icon(Icons.camera),),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: productIdController ,
                              onChanged: (String id) {},
                              decoration: InputDecoration(
                                  labelText: ("Urun ID"),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black54, width: 2))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: productNameController ,
                              onChanged: (String name) {},
                              decoration: InputDecoration(
                                  labelText: ("Urun Adı"),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black54, width: 2))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: productCategoryController ,
                              onChanged: (String category) {},
                              decoration: InputDecoration(
                                  labelText: ("Urun Kategorisi"),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black54, width: 2))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: productUnitsInStockController ,
                              onChanged: (String numberOfPage) {},
                              decoration: InputDecoration(
                                  labelText: ("Urun Stogu"),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black54, width: 2))),
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
                                  child: Text("Güncelle"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.blue,
                                    elevation: 4,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Sil"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.green,
                                    elevation: 4,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => onClearPressed(),
                                  child: Text("Temizle"),
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
                        ]))));

  }
  void _showImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Galeriden Fotoğraf Seç"),
                  onTap: () {
                    _imageUpload(ImageSource.gallery);
                  },
                ),
                ListTile(
                  title: Text("Kameradan Fotoğraf Çek"),
                  onTap: () {
                    _imageUpload(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
    );
}

  void _imageUpload(ImageSource source) async {
    final picker = ImagePicker();
    final selected = await picker.getImage(source: source);
    setState(() {
      if (selected != null) {
        // _selectedImage = File (selected.path);
        _imageCutter(File(selected.path));
      }
    });
    Navigator.pop(context);
  }
  void _imageCutter(File photo) async {
    File? cutterPhoto = await ImageCropper.cropImage(sourcePath: photo.path,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        maxHeight: 800);
    if (cutterPhoto != null) {
      setState(() {
        _selectedImage = cutterPhoto;
      });
    }}

  onClearPressed() {
    productNameController.clear();
    productUnitsInStockController.clear();
    productIdController.clear();
    productCategoryController.clear();
  }}
