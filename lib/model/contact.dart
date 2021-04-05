import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_type.dart';
class Contact{
  final String name;
  final String phone;
  final String email;
  final String cpf;
  final ContactType type;
  Contact({@required this.name, @required this.phone, @required this.email, @required this.cpf,  @required this.type});

  @override
  bool operator ==(Object other)=>
      identical(this, other) ||
      other is Contact &&
        runtimeType == other.runtimeType &&
        phone == other.phone;

  @override
  int get hashCode => phone.hashCode;
}
class ContactHelper{
  static Icon getIconByContactType(ContactType type) {
    switch (type) {
      case ContactType.ANYONE:
        return Icon(Icons.phone_android, color: Colors.grey[700]);
      case ContactType.CELLPHONE:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContactType.FAVORITE:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContactType.WORKER:
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContactType.HOME:
        return Icon(Icons.home, color: Colors.purple[600]);
    }
  }
  static String getDescription(ContactType type){
    return type.toString().replaceAll("ContactType.", "");
  }
}