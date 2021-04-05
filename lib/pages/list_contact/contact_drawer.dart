
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tpl_form_sample/pages/list_contact/conatct_list_page.dart';
import 'package:tpl_form_sample/pages/new_contact/new_contact_page.dart';
import 'package:tpl_form_sample/pages/use_terms/use_terms_page.dart';

class ContactDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Gabriel E. Silva"),
              accountEmail: Text("gabrielespinhara13@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "GS",
                  style: TextStyle(fontSize: 40),
                ),
              ),
          ),
          ListTile(
            title: Text("New Contact"),
            onTap: () => sendTo(context, NewContactPage()),
          ),
          // ListTile(
          //   title: Text("Contacts"),
          //   onTap: () => sendTo(context, ListContactPage()),
          // ),
          ListTile(
            title: Text("Use Terms"),
            onTap: () => sendTo(context, UseTermsPage()),
          )
        ],
      ),
    );
  }
  sendTo(BuildContext context, Widget page){
    Navigator.of(context).pop();
    Navigator.of(context).pushAndRemoveUntil
      (new MaterialPageRoute(builder: (_) => page), ModalRoute.withName("/"));
  }
}