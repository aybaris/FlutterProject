import 'package:flutter/material.dart';
import 'package:vs_code_flutter_demo/week2/core/components/card/user_card.dart';
import 'package:vs_code_flutter_demo/week2/core/components/opacity/image_opacity.dart';
import 'package:vs_code_flutter_demo/week2/core/enum/duration_enum.dart';
import 'package:vs_code_flutter_demo/week2/core/image_manager.dart';
import 'package:vs_code_flutter_demo/week2/statefull/model/user.dart';
import 'package:vs_code_flutter_demo/week2/stateless/home_detail_stateless.dart';

class HomeViewStatefull extends StatefulWidget {
  @override
  _HomeViewStatefullState createState() => _HomeViewStatefullState();
}

class _HomeViewStatefullState extends State<HomeViewStatefull> {
  bool _isLoading = true;
  late final ImageManager
      imageManager; //late almasının sebebi daha sonra kesin bir image alacağı için sistemde bşuna bellek harcamamak için

  late final User user;

//ilk çalıştığı anda initstate anad içeri girer . istek atmak  sayfa yüklendiğinde bir şey yapmak istenirse burada yapılır
  @override
  void initState() {
    super.initState();
    waitForLoading();
    imageManager = ImageManager(); //burada başladığında direkt newleniyor
    user = User.fakeItem();
  }

  Future<void> waitForLoading() async {
    await Future.delayed(DurationEnums.NORMAL.time);
    setState(() {
      _isLoading = false;
    });
  }

  // widgetın öldüğü an gibi olur çıktığı an yapılmak istenen şeyler yapılır.
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //flutterda sayfa yapmaya başlarken conteiner üzerinden değil scaffold ile başlarız . scaffold
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _isLoading ? CircularProgressIndicator() : FlutterLogo(),
          ImageOpacity(url: imageManager.randomImage),
          UserCard(
              user: user,
              onPressed: () {
                _navigateDetail();
              }),
        ],
      ),
    );
  }

  void _navigateDetail() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomeDetailStateless(model: user),
    ));
  }
}
// stateless 