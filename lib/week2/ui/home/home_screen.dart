import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vs_code_flutter_demo/week2/core/components/card/post_information_card.dart';
import 'package:vs_code_flutter_demo/week2/core/components/card/product_card.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/model/post_product.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/service/place_holder_service.dart';

var _scaffoldState = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlaceHolderService placeHolderService = PlaceHolderService();

  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
        appBar: AppBar(
          backgroundColor: Color(0xFFB71C1C),
          title: Text("Logo Panel"),
          actions:<Widget> [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return InformationDataScreen(referenceCode:"" ,imageData:"" ,description:"" ,barcode: "",id: "",);
                }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
        body: SafeArea(
            child: StreamBuilder(
              initialData: [
                placeHolderService.fetchPostItems()
              ],

            stream: placeHolderService.fetchPostItems().asStream()  ,
             builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.connectionState == ConnectionState.done) {
              var response = snapshot.data as List<Product>;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: response.length,
                  itemBuilder: (context,position) {
                    var productItem = response[position];
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return InformationDataScreen(id: productItem.id,barcode: productItem.barcode, description: productItem.description,imageData: productItem.imageData,referenceCode: productItem.referenceCode,);
                            }));}
                        ,
                        child: Card(color: Color(0xffcfd8dc),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Align(
                                    alignment: Alignment.centerLeft,//aligns CircleAvatar to Top Center.
                                    child:
                                    CircleAvatar(
                                        radius: 50,//radius is 50
                                        backgroundImage: MemoryImage(base64Decode(productItem.imageData))//image url
                                    ),
                                  ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      children: [
                                        Text(productItem.description, style: Theme.of(context).textTheme.subtitle1,),
                                       // Text(productItem.barcode.toString(), style: Theme.of(context).textTheme.subtitle1,),
                                        Text(productItem.referenceCode,style: Theme.of(context).textTheme.subtitle1,),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),

                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [ TextButton(
                                    child: Text("Ürünü Sil"), onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Ürün silinecek !"),
                                              content: Text(" ${productItem.description} isimli ürün silinecek. Emin misiniz?"),
                                              actions: [
                                                TextButton(onPressed: () {placeHolderService.deleteProduct(productItem).then((value) => Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen())));}, child: Text("Evet")),
                                                TextButton(onPressed: () {Navigator.pop(context);}, child: Text("Hayır"))
                                              ],
                                            );
                                          }
                                      );
                                  },
                                  )]
                                  ,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );

            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    )
    );

  }
  
}
