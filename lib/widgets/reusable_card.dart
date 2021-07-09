import 'package:covid_tracker/constant.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/utilities/NumberDisplay.dart';

class ReusableCard extends StatefulWidget {
  final String title;
  final int value;
  final Color color;

  const ReusableCard({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  final display = createDisplay(length: 6);
  @override
  Widget build(BuildContext context) {
    // String valueString = widget.value.toString();
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          // boxShadow: [
          //   BoxShadow(
          //     color: kShadowColor,
          //     blurRadius: 2,
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            Text(
              display(widget.value).toString(),
              style: TextStyle(
                color: widget.color,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
