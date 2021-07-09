import 'package:flutter/material.dart';
import 'package:covid_tracker/constant.dart';

class Prevention extends StatelessWidget {
  const Prevention({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: 30,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Pencegahan',
              style: kHeadingTextStyle,
            ),
          ),
          SizedBox(height: 10),
          _PreventCard(
            title: 'Menggunakan Masker',
            text: kWearMaskText,
            image: 'assets/images/wear_mask.png',
          ),
          _PreventCard(
            title: 'Mencuci Tangan',
            text: kWashHandText,
            image: 'assets/images/wash_hands.png',
          ),
          _PreventCard(
            title: 'Physical Distancing',
            text: kPhysicalDistancingText,
            image: 'assets/images/wash_hands.png',
          ),
        ],
      ),
    );
  }
}

class _PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const _PreventCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(0, 8),
                //     blurRadius: 24,
                //     color: Colors.grey,
                //   ),
                // ],
              ),
            ),
            Positioned(
              left: 10,
              child: Image.asset(image, width: 140),
            ),
            Positioned(
              left: 140,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextTheme().bodyText2,
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: SvgPicture.asset("assets/icons/forward.svg"),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
