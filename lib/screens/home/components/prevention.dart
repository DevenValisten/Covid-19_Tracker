import 'package:flutter/material.dart';
import 'package:covid_tracker/constant.dart';

class Prevention extends StatelessWidget {
  const Prevention({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75, vertical: 15),
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
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          SizedBox(height: 10),
          _PreventCard(
            title: 'Menggunakan Masker',
            text: kWearMaskText,
            image: kWearMaskImage,
            imagePaddingTop: 0,
          ),
          _PreventCard(
            title: 'Mencuci Tangan',
            text: kWashHandText,
            image: kWashHandsImage,
          ),
          _PreventCard(
            title: 'Menjaga Jarak',
            text: kPhysicalDistancingText,
            image: kPhysicalDistancingkImage,
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
  final double imagePaddingTop;

  const _PreventCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    this.imagePaddingTop = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: 160,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 6,
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
              top: imagePaddingTop,
              // child: Image.asset(image, width: 130),
              child: Image.asset(
                image,
                width: 120,
              ),
            ),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding / 2,
                  vertical: kDefaultPadding / 2,
                ),
                height: 150,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 13,
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
