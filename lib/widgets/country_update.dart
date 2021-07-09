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
  final display = createDisplay(length: 5);

  Future fetchData() async {
    http.Response response;
    response = await http.get(
      Uri.parse(kCountryAPI),
    );
    if (response.statusCode == 200) {
      print('berhasil');
      setState(() {
        listResponse = json.decode(response.body);
        indexResponse = listResponse[11];
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
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: 30,
      ),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
          Row(
            children: [
              Icon(Icons.flag),
              SizedBox(width: 20),
              Expanded(
                child: DropdownButton(
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
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Terkonfirmasi',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      display(indexResponse['confirmed']).toString(),
                      style: kReportTextStyle.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  height: 50,
                  color: Colors.grey.withOpacity(0.7),
                ),
                Column(
                  children: [
                    Text(
                      'Sembuh',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      display(indexResponse['recovered']).toString(),
                      style: kReportTextStyle.copyWith(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  height: 50,
                  color: Colors.grey.withOpacity(0.7),
                ),
                Column(
                  children: [
                    Text(
                      ' Meninggal  ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      display(indexResponse['deaths']).toString(),
                      style: kReportTextStyle.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
