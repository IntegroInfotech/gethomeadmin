import 'package:flutter/material.dart';
import 'package:gethomeadmin/screens/admin_screen.dart';
import 'package:gethomeadmin/screens/auth_screen.dart';
import 'package:gethomeadmin/screens/new_item_screen.dart';

void main() {
  runApp(AdminApp());
}

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Home Admin',
      theme: ThemeData(
        buttonColor: Colors.orangeAccent,
        splashColor: Colors.red[900],
        accentColor: Colors.deepOrange,
        backgroundColor: Colors.white,
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: 'novacut',
          ),
          title: TextStyle(
            color: Colors.lightGreen,
            fontFamily: 'cutefont',
            fontSize: 30,
          ),
          subtitle: TextStyle(
            color: Colors.lightBlueAccent,
            fontFamily: 'cutefont',
            fontSize: 25,
          ),
          body1: TextStyle(
            color: Colors.lightBlueAccent,
            fontFamily: 'cutefont',
            fontSize: 80,
          ),
          display1: TextStyle(
            color: Colors.deepPurpleAccent[400],
            fontFamily: 'cutefont',
            fontSize: 20,
          ),
          display2: TextStyle(
            color: Colors.deepOrange[900],
            fontFamily: 'cutefont',
            fontSize: 20,
          ),
          caption: TextStyle(
            color: Colors.deepOrange[900],
            fontFamily: 'cutefont',
            fontSize: 18,
          )
        ),
      ),
      initialRoute: AuthScreen.routeName,
      home: AuthScreen(),
      routes: {
        AuthScreen.routeName: (context) => AuthScreen(),
        AdminScreen.routeName: (context) => AdminScreen(),
        NewItemScreen.routeName: (context) => NewItemScreen(),
      },
      color: Colors.lightBlue,
      themeMode: ThemeMode.light,
    );
  }
}
