import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:ohack/signUp.dart';
import 'package:ohack/optionMenu.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ta', 'IN')],
      path: 'lib/assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: 'Thoorgai',
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: Colors.purple[600],
        accentColor: Colors.purple[600],
        buttonColor: Colors.purple[600],
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(7),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.purple[600]),
        )),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),

        // This makes the visual density adapt to the platform that you run
        // the app on.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'thoorigai Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fb = FirebaseDatabase.instance;
  final myController = TextEditingController();
  final name = "Name";
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
          hintText: "Email_Hint".tr(),
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
          hintText: "Password_Hint".tr(),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = ElevatedButton(
      onPressed: () async {
        setState(() {
          showProgress = true;
        });
        try {
          final newUser = await _auth.signInWithEmailAndPassword(
              email: email, password: password);
          print(newUser.toString());
          if (newUser != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OptionMenu()),
            );

            setState(() {
              showProgress = false;
            });
          }
        } catch (e) {}
      },
      child: Text("Login".tr(),
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    final signUpButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUp()),
        );
      },
      child: Text("Sign_Up".tr(),
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    final enLangButton = Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
            onPressed: () {
              context.locale = Locale('en', 'US');
            },
            child: Text('EN')));

    final taLangButton = Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
          onPressed: () {
            context.locale = Locale('ta', 'IN');
          },
          child: Text('TA')),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
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
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width - 50,
                      child: loginButton),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 50,
                      child: signUpButton),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [enLangButton, taLangButton],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
