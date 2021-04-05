import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'contact_form.dart';
import 'contact_model.dart';

class NewContactPage extends StatefulWidget{
  final ContactModel contact;
  const NewContactPage.edit({Key key, this.contact}) : super(key: key);
  NewContactPage(): this.contact = new ContactModel();
  @override
  _NewContactPageState createState() => _NewContactPageState(contact);
}

class _NewContactPageState extends State<NewContactPage>{
  final ContactModel contact;
  _NewContactPageState(this.contact);
  @override
  Widget build( BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) => Text(contact.name ?? '')),
      ),
      body: ContactForm(contact: contact),
    );
  }
}