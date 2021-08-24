import 'package:bytebank/constants.dart';
import 'package:bytebank/screens/contact_list.dart';
import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const DashboardTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(50.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              (MaterialPageRoute(
                builder: (context) => ContactList(),
              )),
            );
          },
          child: Container(
            height: 80.0,
            width: double.maxFinite,
            color: Colors.transparent,
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
