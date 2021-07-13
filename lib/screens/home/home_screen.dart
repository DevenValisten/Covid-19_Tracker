import 'package:covid_tracker/screens/home/components/Symptomps.dart';
import 'package:covid_tracker/screens/home/components/self_test.dart';
import 'package:covid_tracker/widgets/custom_app_bar.dart';
import 'package:covid_tracker/screens/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'components/country_update.dart';
import 'components/global_update.dart';
import 'components/header.dart';
import 'components/learn_more.dart';
import 'components/prevention.dart';
import 'components/symtomps_contact.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> refresh() async {
    setState(() {
      print('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavigationDrawer(),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 40.0),
        child: CustomAppBar(title: 'Home Screen', scrollOffset: _scrollOffset),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return refresh();
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Header(),
              GlobalUpdate(),
              CountryUpdate(),
              Prevention(),
              Symptoms(),
              SymptomsContact(),
              // SelfTest(),
              LearnMore(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

//
//
// body: CustomScrollView(
//   controller: _scrollController,
//   slivers: [
//     SliverToBoxAdapter(child: Header()),
//     SliverToBoxAdapter(child: GlobalUpdate()),
//     SliverToBoxAdapter(child: CountryUpdate()),
//     SliverToBoxAdapter(child: Prevention()),
//     SliverToBoxAdapter(child: LearnMore()),
//   ],
// ),
