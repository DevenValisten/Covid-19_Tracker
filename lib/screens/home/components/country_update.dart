import 'dart:convert';

import 'package:covid_tracker/utilities/NumberDisplay.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/constant.dart';
import 'package:http/http.dart' as http;

class CountryUpdate extends StatefulWidget {
  const CountryUpdate({
    Key? key,
  }) : super(key: key);

  @override
  _CountryUpdateState createState() => _CountryUpdateState();
}

class _CountryUpdateState extends State<CountryUpdate> {
  List listResponse = [];
  Map indexResponse = {};
  Map indexResponseAtributes = {};
  Map confirmedMap = {};
  Map recoveredMap = {};
  Map deathsMap = {};
  double confirmed = 0;
  double recovered = 0;
  double deaths = 0;

  bool isLoading = true;

  Future fetchData() async {
    http.Response response;
    response = await http.get(
      Uri.parse(kCountryAPI),
    );
    if (response.statusCode == 200) {
      setState(() {
        listResponse = json.decode(response.body);
        indexResponse = listResponse[11];
        isLoading = false;
        // confirmed = indexResponse['confirmed'];
        // recovered = indexResponse['recovered'];
        // deaths = indexResponse['deaths'];
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
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     color: kShadowColor,
        //     blurRadius: 5,
        //   ),
        // ],
      ),
      child: Column(
        children: [
          _CountryCardTitle(),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _CountryCardChild(
                  title: 'Terkonfirmasi',
                  apiTitle: 'confirmed',
                  isLoading: isLoading,
                  indexResponse: indexResponse,
                  textColor: Colors.blue,
                ),
                customVerticalDivider(),
                _CountryCardChild(
                  isLoading: isLoading,
                  indexResponse: indexResponse,
                  title: 'Sembuh',
                  apiTitle: 'recovered',
                  textColor: Colors.green,
                ),
                customVerticalDivider(),
                _CountryCardChild(
                  isLoading: isLoading,
                  indexResponse: indexResponse,
                  title: 'Meninggal',
                  apiTitle: 'deaths',
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container customVerticalDivider() {
    return Container(
      width: 1,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.grey.withOpacity(0.7),
    );
  }
}

// -->> Start
class _CountryCardChild extends StatelessWidget {
  final Display formatedNumericDisplay = createDisplay(length: 5);

  _CountryCardChild({
    Key? key,
    required this.isLoading,
    required this.indexResponse,
    required this.title,
    required this.apiTitle,
    required this.textColor,
  }) : super(key: key);

  final String title;
  final String apiTitle;
  final bool isLoading;

  final Map indexResponse;
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
                  formatedNumericDisplay(indexResponse[apiTitle]).toString(),
                  style: kReportTextStyle.copyWith(
                    color: textColor,
                  ),
                ),
        ],
      ),
    );
  }
}
// -->> END

class _CountryCardTitle extends StatelessWidget {
  const _CountryCardTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.flag),
        SizedBox(width: 20),
        Expanded(
          child: DropdownButton(
            focusColor: Colors.grey[700],
            dropdownColor: Colors.grey[800],
            isExpanded: true,
            underline: SizedBox(),
            value: 'Indonesia',
            items: ['Indonesia', 'Bangladesh', 'United States']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
