import 'package:tpl_form_sample/model/contact.dart';
import 'package:tpl_form_sample/model/contact_type.dart';

class ContactRepository{
  static  List<Contact> _contacts = [];
  ContactRepository(){
    if(_contacts.isEmpty){
      _contacts.add(new Contact(name: "Love", phone: "123456789", type: ContactType.FAVORITE));
      _contacts.add(new Contact(name: "I", phone: "123456789", type: ContactType.CELLPHONE));
      _contacts.add(new Contact(name: "Stephen", phone: "123456789", type: ContactType.WORKER));
      _contacts.add(new Contact(name: "Mother", phone: "123456789", type: ContactType.FAVORITE));
      _contacts.add(new Contact(name: "Steve", phone: "123456789", type: ContactType.ANYONE));
      _contacts.add(new Contact(name: "Father", phone: "123456789", type: ContactType.FAVORITE));
      _contacts.add(new Contact(name: "Brother", phone: "123456789", type: ContactType.FAVORITE));
      _contacts.add(new Contact(name: "Mother", phone: "123456789", type: ContactType.HOME));
      _contacts.add(new Contact(name: "Sister", phone: "123456789", type: ContactType.ANYONE));
      _contacts.add(new Contact(name: "Worker", phone: "123456789", type: ContactType.WORKER));
      _contacts.sort((a,b)=> a.name.compareTo(b.name));
    }
  }

  findAllContacts(){
    _contacts.sort((a,b)=> a.name.compareTo(b.name));
    return _contacts;
  }
   
  saveContact(Contact contact){
    if(_contacts.contains(contact)){
      _contacts.remove(contact);
    }
    _contacts.add(contact);
  }
}