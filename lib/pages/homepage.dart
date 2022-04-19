import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/pages/log/login.dart';
import 'package:helpings_needlys/sharedpreferances/keys_sharedpreferances.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
          actions: [
            IconButton(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! / 15),
              icon: const Icon(Icons.logout),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (__) {
                      return Dialog(
                        child: SizedBox(
                            height: 180,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(TKeys().logout),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(TKeys().areyoursurelogout),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton.icon(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  ColorsTheme
                                                      .darkPrimaryColor)),
                                      onPressed: () async {
                                        SharedPreferences preferences =
                                            await SharedPreferences
                                                .getInstance();

                                        preferences.remove(
                                            KeysSharedpreferances.EMAIL);
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LogIn()),
                                                (route) => false);
                                      },
                                      icon: const Icon(Icons.logout),
                                      label: Text(TKeys().logout),
                                    ),
                                    ElevatedButton.icon(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(Icons.cancel),
                                      label: Text(TKeys().cancel),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      );
                    });
              },
            )
          ],
          centerTitle: true,
          title: Text(
            TKeys().home,
          ),
        ),
        bottomNavigationBar: menu(),
        body: const TabBarView(
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
        indicatorPadding: const EdgeInsets.all(5.0),
        indicatorColor: Colors.cyan,
        tabs: [
          Tab(
            text: TKeys().home,
            icon: const Icon(Icons.home),
          ),
          Tab(
            text: TKeys().connect,
            icon: const Icon(Icons.contact_support),
          ),
          Tab(
            text: TKeys().setting,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
