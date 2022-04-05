import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'home/settings_containt_page.dart';
import 'home/connect_containt_page.dart';
import 'home/home_containt_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            TKeys().home,
          ),
        ),
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: [
            HomeContaintPage(),
            ConnectContaintPage(),
            SettingsContaintPage(),
          ],
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: ColorsTheme.darkPrimaryColor,
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.cyan,
        tabs: [
          Tab(
            text: TKeys().home,
            icon: Icon(Icons.home),
          ),
          Tab(
            text: TKeys().connect,
            icon: Icon(Icons.contact_support),
          ),
          Tab(
            text: TKeys().setting,
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
