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
      padding: EdgeInsets.only(top: 50),
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dark Mode'),
                Checkbox(
                  value: _isDarkMode,
                  onChanged: (value) {
                    toogleDarkTheme();
                  },
                  activeColor: Colors.blue,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  // Text('Dark Mode'),
                  // Switch.adaptive(
                  //   value: _value,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _value = !_value;
                  //     });
                  //   },
                  // ),

                  GestureDetector(
                    onTap: () {
                      ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: false);
                      provider.setLightTheme();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      color: Colors.blue,
                      child: Text('Light Mode'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: false);
                      provider.setDarkTheme();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      color: Colors.grey[800],
                      child: Text('Dark Mode'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
