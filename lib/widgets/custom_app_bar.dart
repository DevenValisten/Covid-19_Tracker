import 'package:covid_tracker/theme/my_theme.dart';
import 'package:covid_tracker/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final double scrollOffset;

  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    Color navColor;
    Color _endColor;
    if (provider.getTheme == MyTheme().lightTheme) {
      _endColor = Colors.white;
      navColor = Colors.black;
    } else {
      _endColor = Colors.black;
      navColor = Colors.white;
    }

    return AppBar(
      // padding: EdgeInsets.symmetric(vertical: 10),
      backgroundColor: _endColor.withOpacity((scrollOffset / 180).clamp(0, 1).toDouble()),
      elevation: 0,
      leading: InkWell(
        child: Icon(Icons.sort, color: scrollOffset < 100 ? Colors.white : navColor),
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),

      title: _AppBarButton(
        title: 'Covid-19 Tracker',
        scrollOffset: scrollOffset,
        onTap: () {},
      ),
      centerTitle: true,
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double scrollOffset;

  const _AppBarButton({
    Key? key,
    this.title = '',
    required this.onTap,
    required this.scrollOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    Color _endColor;

    if (provider.getTheme == MyTheme().lightTheme) {
      _endColor = Colors.black;
    } else {
      _endColor = Colors.white;
    }

    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          // color: scrollOffset > 250 ? Colors.black : Colors.white,
          color: scrollOffset < 100 ? Colors.transparent : _endColor,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
