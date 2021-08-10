import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/model/post_login_model.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/service/api_service.dart';
import 'package:vs_code_flutter_demo/week2/ui/home/home_screen.dart';

class LoginScreen extends StatefulWidget{

  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen>{
  ApiService apiService = ApiService();
  TextEditingController _loginMailController = TextEditingController();
  TextEditingController _loginPasswordController = TextEditingController();
  bool isRememberMe = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: _loginMailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ) ,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )
            ),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Şifre',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: _loginPasswordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ) ,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'Şifre',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )
            ),
          ),
        )
      ],
    );
  }

  Widget buildForgotPasswordButton() {
    return Container(
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            TextButton(onPressed: () => print("Şifreni unuttuysan tıkla"), child: Text(
              'Şifreni mi unuttun ?',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ))
          ],
        )
    );
  }

  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) { setState(() {
                  isRememberMe = value!;
                }); },
              ),
          ),
          Text(
            'Beni Hatırla',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(

        onPressed: () => loginPressed(),
        child: Text("GİRİŞ",
        style: TextStyle(
          color: Color(0xffd50000),fontSize: 38, fontWeight: FontWeight.bold
        ),),
        style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.green,
        shadowColor: Colors.green,
        elevation: 5,
        padding: EdgeInsets.all(15.0)
    ),
    ));
  }

  Widget buildSignUpButton() {
    return GestureDetector(
      onTap: () => print("Kayıt olma menü"),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text:  'Hesap açmak ister misin ?',
                style: TextStyle
                  (
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                )
            ),
            TextSpan(
            text: 'Kayıt ol',
            style: TextStyle(
            color: Colors.white,
        fontSize: 19,
              fontWeight: FontWeight.bold,
            )

    )
          ],
      ),
    ));

  }

  Widget build(BuildContext context){
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child:  GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width:  double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffd50000),
                        Color(0xffd50000),
                        Color(0xffd50000),
                        Color(0xffd50000),
                      ]
                  ),
                ),
               child: SingleChildScrollView(
                 physics: AlwaysScrollableScrollPhysics(),
                 padding: EdgeInsets.symmetric(
                   horizontal: 25,
                   vertical: 120,
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'Giriş Yap',
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 40,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     SizedBox(height: 50,),
                     buildEmail(),
                     SizedBox(height: 50,),
                     buildPassword(),
                     buildForgotPasswordButton(),
                     buildRememberCb(),
                     buildLoginButton(),
                     buildSignUpButton(),

                   ],
                 ) ,
               ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  loginPressed() {
    String mail = _loginMailController.text;
    String password = _loginPasswordController.text;
  apiService.login(mail,password).then((value) => value.success == true ? Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(token: value.token,isSuccess: value.success,))): null );
  }
}