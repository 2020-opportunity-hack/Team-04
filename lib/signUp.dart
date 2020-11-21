import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ohack/main.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      onChanged: (value) {
        email = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      onChanged: (value) {
        password = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    // final reEnterPasswordField = TextField(
    //   obscureText: true,
    //   style: style,
    //   decoration: InputDecoration(
    //       contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //       hintText: "Re-enter Password",
    //       border:
    //           OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    // );

    final loginButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(title: 'Thoorgayi Login')),
        );
      },
      child: Text("Login",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold))
          .tr(),
    );

    final signUpButton = ElevatedButton(

      onPressed: () async {
        setState(() {
          showProgress = true;
        });
        try {
          final newuser = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
          if (newuser != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
            setState(() {
              showProgress = false;
            });
          }
        } catch (e) {}
      },

      // onPressed: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => MyHomePage()),
      //   );
      // },
      child: Text("Sign_Up",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold))
          .tr(),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 125.0,
                    child: Image.asset(
                      "lib/assets/images/logo.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 45.0),
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  // SizedBox(height: 25.0),
                  // reEnterPasswordField,
                  SizedBox(
                    height: 35.0,
                  ),
                  signUpButton,
                  SizedBox(
                    height: 15.0,
                  ),
                  loginButton
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class Category extends StatelessWidget {
//   final String image_location;
//   final String image_caption;

//   Category({this.image_location, this.image_caption});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: InkWell(
//         onTap: () {},
//         child: Container(
//           width: 100.0,
//           child: ListTile(
//             title: Image.asset(
//               image_location,
//               width: 100.0,
//               height: 80.0,
//             ),
//             subtitle: Container(
//               alignment: Alignment.topCenter,
//               child: Text(image_caption),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
