import 'package:covid_tracker/constant.dart';
import 'package:covid_tracker/screens/credit.dart';
import 'package:covid_tracker/theme/my_theme.dart';
import 'package:covid_tracker/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    bool _isDarkMode = provider.getTheme == MyTheme().darkTheme ? true : false;
    toogleDarkTheme() {
      setState(() {
        provider.toogleTheme();
        _isDarkMode = !_isDarkMode;
      });
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 25),
      width: MediaQuery.of(context).size.width * 0.72,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.button,
                ),
                Checkbox(
                  value: _isDarkMode,
                  onChanged: (value) {
                    toogleDarkTheme();
                  },
                  activeColor: Colors.blue,
                ),
              ],
            ),

            Divider(color: Colors.grey),
            // _DrawerButton(
            //   text: 'Credit',
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Credit(),
            //       ),
            //     );
            //   },
            // ),

            // _DrawerButton(
            //   text: 'Rate Aplikasi ini',
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  _DrawerButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 1.5),
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
