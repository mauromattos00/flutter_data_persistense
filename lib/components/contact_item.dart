import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;

  ContactItem({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final TextStyle _nameInputStyle = TextStyle(
    fontSize: 24.0,
  );

  final TextStyle _accountNumberInputStyle = TextStyle(
    fontSize: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.fullName,
          style: _nameInputStyle,
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: _accountNumberInputStyle,
        ),
      ),
    );
  }
}
