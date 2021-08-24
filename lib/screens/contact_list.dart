import 'package:bytebank/components/progress_indicator.dart';
import 'package:bytebank/components/contact_item.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/constants.dart';

class ContactList extends StatefulWidget {
  ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<Contact> contactList = [];
  final ContactDao _dao = ContactDao();

  Widget _handleConnectionState(AsyncSnapshot snapshot) {
    final Widget widget;

    switch (snapshot.connectionState) {
      case ConnectionState.none:
        widget = Text('Unknown Error');
        break;

      case ConnectionState.active:
        widget = Text('Unknown Error');
        break;

      case ConnectionState.waiting:
        widget = CustomProgressIndicator(context: context);
        break;

      case ConnectionState.done:
        final List<Contact> contactList = snapshot.data;

        widget = ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (BuildContext context, int index) {
            return _renderContactItem(contactList, index);
          },
        );
    }

    return _renderAnimationSwitcher(widget);
  }

  Widget _renderAnimationSwitcher(Widget child) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      child: child,
    );
  }

  ContactItem _renderContactItem(List<Contact> contactList, int index) {
    final Contact contact = contactList[index];
    return ContactItem(contact: contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contactListScreenTitle),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return _handleConnectionState(snapshot);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then((value) => setState(() => widget.createState()));
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
