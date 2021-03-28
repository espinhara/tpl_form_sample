import 'package:mobx/mobx.dart';

part 'contact_model.g.dart';

class ContactModel  = BaseContactModel with _$ContactModel;

abstract class  BaseContactModel with Store{
  @observable
  String name;

  @observable
  String email;

  String cpf;
  String phone;
  ContactType type ;

  @action
  setName(String name){
    this.name = name;
  }

  @action
  setEmail(String email){
    this.email = email;
  }


   String toJson() {
    return '{name: $name, email: $email, cpf: $cpf, phone: $phone,  type: $type}';
  }
}

enum ContactType { HOME, WORKER, FAVORITE, CELLPHONE}