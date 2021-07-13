import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constant.dart';

class SymtompsContact extends StatelessWidget {
  const SymtompsContact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75, vertical: 15),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding / 1.5,
        vertical: kDefaultPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(kPeopleSickImage),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Apakah anda merasa sakit?',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Jika anda merasa sakit dengan gejala covid, silahkan hubungi nomor dibawah ini, untuk mendapatkan bantuan secepat mungkin',
                      style: kSubtitle3,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),

          // Call & SMS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ContactButton(
                title: 'Telepon',
                icon: Icons.call,
                color: Color(0xff00E617),
                onTap: () {
                  launch("tel:119");
                },
              ),
              _ContactButton(
                title: 'Kirim SMS',
                icon: Icons.message,
                color: Color(0xff26A1FF),
                onTap: () {
                  launch("sms:119");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 135,
        height: 40,
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 1.2,
          vertical: kDefaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
