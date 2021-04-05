import 'package:mobx/mobx.dart';
import 'package:tpl_form_sample/model/contact.dart';
import 'package:tpl_form_sample/model/contact_type.dart';

part 'contact_model.g.dart';

class ContactModel  = BaseContactModel with _$ContactModel;

abstract class  BaseContactModel with Store{
  @observable
  String name;

  @observable
  String email;

  @observable
  String cpf;

  @observable
  String phone;

  @observable
  ContactType type ;

  @action
  setName(String name){
    this.name = name;
  }

  @action
  setEmail(String email){
    this.email = email;
  }

  @action
  setCPF(String cpf){
    this.cpf =  cpf;
  }

  @action
  setPhone(String phone){
    this.phone = phone;
  }

  @action
  setType( ContactType type){
    this.type = type;
  }

   String toJson() {
    return '{name: $name, email: $email, cpf: $cpf, phone: $phone,  type: $type}';
  }
  Contact toContact(){
    return Contact(name: name, phone: phone, email: email, type: type, cpf: cpf);
  }
  static ContactModel fromContact(Contact contact ){
    var contactModel = ContactModel();
    contactModel.name = contact.name;
    contactModel.phone = contact.phone;
    contactModel.email = contact.email;
    contactModel.type = contact.type;
    contactModel.cpf = contact.cpf;
    return contactModel;
  }
}