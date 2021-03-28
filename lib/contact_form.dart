import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:brasil_fields/brasil_fields.dart';
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
                decoration: InputDecoration(
                  labelText: 'Nome',
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
              keyboardType: TextInputType.number,
              onChanged: updatePhone ,
              decoration: InputDecoration(
                  labelText: "Celular",
                  border: OutlineInputBorder(),
              ),
            ),
            Observer(
              builder:(_) =>
              TextFormField(
                validator: emailValidator(),
                onChanged: updateEmail,
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
              keyboardType: TextInputType.number,
              onChanged: updateCpf,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CPF'
              ),

            ),
            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                  print(contact);
                }
              },
              child: Text('Salvar'),
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
  void updatePhone(phone) => setState(() { contact.phone = phone;});
  void updateEmail(email) => setState(() { contact.email = email; });
  void updateCpf(cpf) => setState(() { contact.email = cpf; });

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