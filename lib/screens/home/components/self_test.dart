import 'package:covid_tracker/constant.dart';
import 'package:flutter/material.dart';

class SelfTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75, vertical: 15),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(kCovidSearchImage),
          ),
          SizedBox(width: kDefaultPadding),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lakukan Test Sendiri',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17),
                ),
                SizedBox(height: kDefaultPadding / 2),
                Text(
                  'Ikuti perintah yang diberikan untuk melakukan test mandiri',
                  style: kSubtitle3.copyWith(height: 1.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
