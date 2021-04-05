import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:tpl_form_sample/model/contact.dart';
import 'package:tpl_form_sample/model/contact_type.dart';
import 'package:tpl_form_sample/repository/contact_repository.dart';
import 'contact_model.dart';

class ContactForm extends StatefulWidget{
  final ContactModel contact;
  const ContactForm({Key key, this.contact}) : super(key : key);
  @override
  _ContactFormState createState() => _ContactFormState(this.contact);
}

class _ContactFormState extends State<ContactForm>{
  final ContactModel contact;
  final _formKey = GlobalKey<FormState>();
  _ContactFormState(this.contact);

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 20,
          runSpacing: 10,
          children: <Widget>[
            Observer(
            builder:(_) =>
              TextFormField(
                validator: nameValidator(),
                onChanged: updateName,
                initialValue: contact.name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                maxLength: 100,
              ),
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              initialValue: contact.phone,
              keyboardType: TextInputType.number,
              onChanged: updatePhone ,
              decoration: InputDecoration(
                  labelText: "Cell Phone",
                  border: OutlineInputBorder(),
              ),
            ),
            Observer(
              builder:(_) =>
              TextFormField(
                validator: emailValidator(),
                onChanged: updateEmail,
                initialValue: contact.email,
                decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(),
                    errorText: emailTextValidator()
                ),
              ),
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              initialValue: contact.cpf,
              keyboardType: TextInputType.number,
              onChanged: updateCpf,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CPF'
              ),
            ),
            Observer(
              builder: (_)=> DropdownButtonFormField<ContactType>(
                value: contact.type,
                decoration: InputDecoration(border: OutlineInputBorder()),
                items: ContactType.values.map((ContactType value){
                  return DropdownMenuItem<ContactType>(
                    value: value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContactHelper.getIconByContactType(value),
                        Text(ContactHelper.getDescription(value))
                      ],
                    ),
                  );
                }).toList(),
                onChanged: updateContactType,
              ),
            ),
            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                 ContactRepository().saveContact(contact.toContact());
                 Navigator.of(context)
                  .pushNamedAndRemoveUntil( "/" , (_) => false);
                }
              },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
  String emailTextValidator() =>
      contact.email != null ? emailValidator().call(contact.email) : null;

  void updateName(name){
    contact.setName(name);
  }
  void updatePhone(phone)  { contact.phone = phone;}
  void updateEmail(email) { contact.email = email; }
  void updateCpf(cpf)  { contact.cpf = cpf; }
  void updateContactType(type) {contact.type = type;}

  TextFieldValidator emailValidator(){
    return EmailValidator(errorText: 'E-mail inválido');
  }

  FieldValidator nameValidator(){
    return MultiValidator([
      RequiredValidator(errorText: 'Campo obrigatório'),
      MinLengthValidator(4, errorText: "Tamanho mínimo de 4 caracteres")
    ]);
  }
}