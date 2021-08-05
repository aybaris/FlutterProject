import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:vs_code_flutter_demo/week2/app.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/model/post_product.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/service/place_holder_service.dart';
import 'package:vs_code_flutter_demo/week2/ui/home/home_screen.dart';
class InformationDataScreen extends StatefulWidget {
  String id;
  String referenceCode;
  String description;
  String imageData;
  String barcode;


  bool _isApiProcess = true;

  InformationDataScreen({required this.id ,required this.referenceCode,   required this.description , required this.imageData ,  required this.barcode });

  @override
  _InformationDataScreenState createState() => _InformationDataScreenState();
}
 final String randomImage= 'https://vay-be.net/uploads/noproductimage.png';
class _InformationDataScreenState extends State<InformationDataScreen> {
  late Product _product = Product(referenceCode: widget.referenceCode, description:  widget.description, imageData:  widget.imageData, barcode: widget.barcode, id: '');
  String _data ="";
  PlaceHolderService placeHolderService = PlaceHolderService();
  File? _selectedImage;
  TextEditingController _productReferenceCodeController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _productBarcodeController = TextEditingController();
  late String tempId;
  late String tempImageData;

  @override
  void initState() {
    tempId = widget.id;
    tempImageData = widget.imageData;
    _productReferenceCodeController.text = widget.referenceCode.toString();
    _productDescriptionController.text = widget.description.toString();
    _productBarcodeController.text = widget.barcode.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xFFB71C1C),
          title: Text("Ürün profili"),
        ),
        body: Container(
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

                           child:  widget.referenceCode == "" ?
                           CircleAvatar(
                             child: _selectedImage == null ? Text("Fotoğraf"): null ,
                             radius: 100,
                             backgroundImage:_selectedImage != null ? FileImage(_selectedImage!) : null, //image url
                           )
                               :
                           CircleAvatar(
                              child: _selectedImage == null ?  Image.memory(base64Decode(tempImageData),fit: BoxFit.fill,): Image.file(_selectedImage!,fit: BoxFit.fill,),
                             radius: 100,//radius is 50
                               //image url
                           ),

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
                     height: 10.0,
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       controller: _productReferenceCodeController ,
                       onChanged: (String name) {},
                       keyboardType: TextInputType.text,
                       decoration: InputDecoration(
                           labelText: ("Urun Referans Kodu"),
                           focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(
                                   color: Colors.black54, width: 2))),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       controller: _productDescriptionController ,
                       onChanged: (String category) {},
                       keyboardType: TextInputType.text,
                       decoration: InputDecoration(
                           labelText: ("Urun Açıklaması"),
                           focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(
                                   color: Colors.black54, width: 2))),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       controller: _productBarcodeController ,
                       onChanged: (String numberOfPage) {},
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                           labelText: ("Urun Barkodu"),
                           focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(
                                   color: Colors.black54, width: 2))),
                     ),
                   ),
                   ElevatedButton(
                     onPressed: () async =>_scan() ,
                     child: Text("Barkod Ekle"),
                     style: ElevatedButton.styleFrom(
                       primary: Colors.deepOrange,
                       onPrimary: Colors.white,
                       shadowColor: Colors.deepOrange,
                       elevation: 4,
                     ),
                   ),

                   widget.referenceCode == "" ?
                   ElevatedButton(
                     child: Text("Gönder"),
                     onPressed: () async {
                      submitButtonPressed();

                       },
                   )
                       : ElevatedButton(
                     child: Text("Değişiklikleri Güncelle"),
                     onPressed: () async {
                      updateButtonPressed();
                   },
                     ),

                 ],
                  ),

        ),
    );


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

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("Kameradan Fotoğraf Çek"),
                  onTap: () {
                    _imageUpload(ImageSource.camera);

                    Navigator.pop(context);
                  },

                ),
              ],
            ),
          ),
    );
}
  void _imageUpload(ImageSource source) async {
    final picker = ImagePicker();
    final selected = await picker.pickImage(source: source);
    setState(() {
      if (selected != null) {
        // _selectedImage = File (selected.path);
        _imageCutter(File(selected.path));
      }
    });
  }
  void _imageCutter(File photo) async {
    File? cutterPhoto = await ImageCropper.cropImage(sourcePath: photo.path,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        maxHeight: 900);
    if (cutterPhoto != null) {
      setState(() {
        _selectedImage = cutterPhoto;
      });
    }}

  onClearPressed() {
    _productReferenceCodeController.clear();
    _productBarcodeController.clear();
    _productDescriptionController.clear();
  }

  void showSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  submitButtonPressed() {
    String referenceCode = _productReferenceCodeController.text.toString().trim();
    String description = _productDescriptionController.text.toString().trim();
  //  String imageData= base64Encode(_selectedImage);
    String barcode = _productBarcodeController.text.toString().trim();
    if(referenceCode.isEmpty){
      showSnackBarMessage("Referans boş olamaz");
    }
    else if (description.isEmpty){
      showSnackBarMessage("Açıklama boş olamaz");
    }
    else if (barcode == "-1"){
      showSnackBarMessage("Barkod -1 olamaz");
    }
    else if(_selectedImage == File(randomImage)){
      showSnackBarMessage("Resim yüklemeden işlem yapılamaz !");
    }
    else {
      final String referenceCode = _productReferenceCodeController.text;
      final String description = _productDescriptionController.text;
      final String barcode =   _productBarcodeController.text;
      String imageData = base64Encode(_selectedImage!.readAsBytesSync());
      Product product = Product(referenceCode: referenceCode, description: description, imageData: imageData, barcode: barcode, id: '');
      print("Product to json " + productToJson(product));
      placeHolderService.createProduct(product).then((value) => Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen())));
      }

    }

  Future _scan() async{
    return await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE).then((value) => setState(()=>_productBarcodeController.text = value));

    }

   updateButtonPressed() {
     String referenceCode = _productReferenceCodeController.text.toString().trim();
     String description = _productDescriptionController.text.toString().trim();
     String tempImageDataUpdate;
     //  String imageData= base64Encode(_selectedImage);
     String barcode = _productBarcodeController.text.toString().trim();
     if(referenceCode.isEmpty){
       showSnackBarMessage("Referans boş olamaz");
     }
     else if (description.isEmpty){
       showSnackBarMessage("Açıklama boş olamaz");
     }
     else if (barcode == "-1"){
       showSnackBarMessage("Barkod -1 olamaz");
     }
     else if(_selectedImage == File(randomImage)){
       showSnackBarMessage("Resim yüklemeden işlem yapılamaz !");
     }
     else {
       final String tempIdUpdate = tempId;
       if(_selectedImage == null){
           tempImageDataUpdate = tempImageData;
       }
       else{
           tempImageDataUpdate =  base64Encode(_selectedImage!.readAsBytesSync());
       }

       //final String tempImageDataUpdate =  base64Encode(_selectedImage.readAsBytesSync());

       final String referenceCode = _productReferenceCodeController.text;
       final String description = _productDescriptionController.text;
       final String barcode =   _productBarcodeController.text;
       //String imageData = base64Encode(_selectedImage.readAsBytesSync());
       Product product = Product(referenceCode: referenceCode, description: description, imageData: tempImageDataUpdate, barcode: barcode, id: tempIdUpdate);
       print("Product to json " + productToJson(product));

       placeHolderService.updateProduct(product).then((value) => Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen())));



     };

   }

  }


