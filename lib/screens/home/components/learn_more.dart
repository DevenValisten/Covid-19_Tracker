import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constant.dart';

class LearnMore extends StatelessWidget {
  const LearnMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75, vertical: 15),
      height: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/images/virus.png'),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.3),
        //     blurRadius: 5,
        //   ),
        // ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              // padding: EdgeInsets.only(top: 18),
              padding: EdgeInsets.all(kDefaultPadding / 2),
              child: Image.asset(
                'assets/images/woman_nurse.png',
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pelajari lebih lanjut mengenai \nCOVID-19',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '#StayHome',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: _launchURL,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Read more',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL() async {
  const url = kCoronaVirusInfoUrl;
  launch(url);
  // if (await canLaunch(url)) {
  //   await launch(url);
  // } else {
  //   throw 'Could not launch $url';
  // }
}
