import 'package:bytebank/components/bytebank_text_field.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/constants.dart';

class ContactForm extends StatefulWidget {
  ContactForm({Key? key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();
  final ContactDao _dao = ContactDao();

  Contact generateContact() {
    final String name = _fullName.text;
    final int? accountNumber = int.tryParse(_accountNumber.text);
    final Contact newContact = new Contact(
      id: 0,
      fullName: name,
      accountNumber: accountNumber!,
    );
    return newContact;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contactFormScreenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            BytebankTextField(
              labelText: contactFormScreenFullNameLabelText,
              inputType: TextInputType.text,
              controller: _fullName,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: BytebankTextField(
                controller: _accountNumber,
                labelText: contactFormScreenAccountNumberLabelText,
                inputType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final Contact generatedContact = generateContact();
                    _dao.save(generatedContact).then((int id) {
                      Navigator.pop(context);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(contactFormScreenButtonText),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
