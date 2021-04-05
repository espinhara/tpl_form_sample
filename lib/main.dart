import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'pages/list_contact/conatct_list_page.dart';
import 'pages/new_contact/contact_model.dart';
import 'pages/new_contact/contact_form.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        '/': (_) => ListContactPage(),
      },
    );
  }
}
