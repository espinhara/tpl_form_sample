import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tpl_form_sample/pages/new_contact/contact_model.dart';
import 'contact_drawer.dart';
import 'package:tpl_form_sample/model/contact.dart';
import 'package:tpl_form_sample/pages/new_contact/new_contact_page.dart';
import 'package:tpl_form_sample/repository/contact_repository.dart';

class ListContactPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: ContactDrawer(),
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            var contact = ContactRepository().findAllContacts()[index];
            return ListTile(
              onTap: () => sendEditContact(context, contact),
              leading: CircleAvatar(
                child: ContactHelper.getIconByContactType(contact.type),
                backgroundColor: Colors.blue[200],
              ),
              title: Text(contact.name),
              subtitle: Text(contact.phone),
              trailing: IconButton(
                icon: Icon(Icons.call),
                onPressed: ()=>{},
              ),
            );
          },
          separatorBuilder: (context, index)=> Divider(),
          itemCount: ContactRepository().findAllContacts().length
      ),
    );
  }

  sendEditContact(BuildContext context, contact){
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (_)=> NewContactPage.edit(contact: BaseContactModel.fromContact(contact))));
  }
}
