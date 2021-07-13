import 'package:flutter/material.dart';
import 'package:covid_tracker/constant.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({
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
              'Gejala',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          SizedBox(height: 10),
          _SymptomsCard(
            title: 'Batuk',
            text: kCoughText,
            image: 'assets/illustration/cough.png',
          ),
          _SymptomsCard(
            title: 'Demam',
            text: kFeverText,
            image: 'assets/illustration/fever.png',
          ),
          _SymptomsCard(
            title: 'Sakit Kepala',
            text: kHeadacheText,
            image: 'assets/illustration/headache.png',
          ),
          _SymptomsCard(
            title: 'Kelelahan',
            text: kFatigueText,
            image: 'assets/illustration/fatigue.png',
          ),
        ],
      ),
    );
  }
}

class _SymptomsCard extends StatelessWidget {
  const _SymptomsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String image;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: kDefaultPadding,
        horizontal: kDefaultPadding / 2,
      ),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Image.asset(image),
            ),
            SizedBox(width: kDefaultPadding / 2),
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: kDefaultPadding / 5),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 13,
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
