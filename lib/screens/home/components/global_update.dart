import 'dart:convert';

import 'package:covid_tracker/utilities/NumberDisplay.dart';
import 'package:covid_tracker/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constant.dart';

class GlobalUpdate extends StatefulWidget {
  const GlobalUpdate({
    Key? key,
  }) : super(key: key);

  @override
  _GlobalUpdateState createState() => _GlobalUpdateState();
}

class _GlobalUpdateState extends State<GlobalUpdate> {
  // String stringResponse = '';
  // List listResponse = [];
  Map mapResponse = {};
  Map confirmedMap = {};
  Map recoveredMap = {};
  Map deathsMap = {};
  int confirmed = 0;
  int recovered = 0;
  int deaths = 0;
  final display = createDisplay(length: 6);

  bool isLoading = true;

  Future fetchData() async {
    http.Response response;
    response = await http.get(
      Uri.parse(kGlobalAPI),
    );
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        confirmedMap = mapResponse['confirmed'];
        recoveredMap = mapResponse['recovered'];
        deathsMap = mapResponse['deaths'];
        confirmed = confirmedMap['value'];
        recovered = recoveredMap['value'];
        deaths = deathsMap['value'];

        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    fetchData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * .75, vertical: 15),
      decoration: BoxDecoration(
        // color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: Column(
          children: [
            _GlobalUpdateTitle(),
            SizedBox(height: 7),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding,
                horizontal: kDefaultPadding / 2,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _GlobalCardChild(
                    isLoading: isLoading,
                    title: 'Terkonfirmasi',
                    value: confirmed,
                    textColor: Colors.blue,
                  ),
                  customVerticalDivider(),
                  _GlobalCardChild(
                    isLoading: isLoading,
                    title: 'Sembuh',
                    value: recovered,
                    textColor: Colors.green,
                  ),
                  customVerticalDivider(),
                  _GlobalCardChild(
                    isLoading: isLoading,
                    title: 'Meninggal',
                    value: deaths,
                    textColor: Colors.red,
                  ),
                  // ReusableCard(
                  //   title: 'Terinfeksi',
                  //   value: confirmed,
                  //   color: Colors.blue,
                  // ),
                  // SizedBox(width: 7),
                  // ReusableCard(
                  //   title: 'Sembuh',
                  //   value: recovered,
                  //   color: Colors.green,
                  // ),
                  // SizedBox(width: 7),
                  // ReusableCard(
                  //   title: 'Meninggal',
                  //   value: deaths,
                  //   color: Colors.red,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container customVerticalDivider() {
    return Container(
      width: 1,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.grey.withOpacity(0.5),
    );
  }
}

class _GlobalCardChild extends StatelessWidget {
  final Display formatedNumericDisplay = createDisplay(length: 5);

  _GlobalCardChild({
    Key? key,
    required this.isLoading,
    required this.title,
    required this.value,
    required this.textColor,
  }) : super(key: key);

  final String title;
  final int value;
  final bool isLoading;

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          isLoading == true
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                )
              : Text(
                  formatedNumericDisplay(value).toString(),
                  style: kReportTextStyle.copyWith(
                    color: textColor,
                  ),
                ),
        ],
      ),
    );
  }
}

class _GlobalUpdateTitle extends StatelessWidget {
  const _GlobalUpdateTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Global Update',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () {
            // setState(() {
            //   confirmed = 0;
            //   recovered = 0;
            //   deaths = 0;
            //   fetchData();
            // });
          },
          child: Text(
            'Refresh',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
