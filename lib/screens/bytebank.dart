import 'package:bytebank/components/dashboard_tile.dart';
import 'package:bytebank/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dashboardScreenTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/images/app-dashboard-image.svg'),
          ),
          DashboardTile(
            icon: Icons.people,
            title: dashboardScreenContactsTileText,
          ),
        ],
      ),
    );
  }
}
