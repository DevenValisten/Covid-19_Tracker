import 'package:covid_tracker/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Color
const kLightScaffoldColor = Color(0xffEBEBEB);
const kCardColor = Colors.white;
final kShadowColor = Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = Color(0xFF4056C6).withOpacity(.15);

const double kDefaultPadding = 20.0;

// Text Style
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);
const kSubTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

const kReportTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w500,
);

const kSubtitle3 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

// URL
const String kCoronaVirusInfoUrl = 'https://www.who.int/indonesia/';

// Text
const String kWearMaskText =
    'Menggunakan masker mengurangi penyebaran tetesan menular, terutama ketika seseorang berbicara, batuk atau bersin, untuk penyakit seperti COVID-19.';
const String kWashHandText =
    'Mencuci tangan selalu menjadi salah satu cara paling efektif untuk mencegah penyakit. Ini adalah tindakan sederhana untuk menjaga diri kita tetap sehat dan aman.';
const String kPhysicalDistancingText =
    'Menjaga jarak fisik membantu membatasi penyebaran COVID-19 – menjaga jarak setidaknya 1m dari satu sama lain dan menghindari menghabiskan waktu di tempat ramai.';

// API
const String kGlobalAPI = 'https://covid19.mathdro.id/api';
const String kCountryAPI = 'https://covid19.mathdro.id/api/confirmed';

// Image
// const String kPeopleSickImageUrl = 'https://i.ibb.co/D1tz1qY/sick.png';
// const String kCovidSearchImageUrl = 'https://i.ibb.co/3Yvkkzc/covid-search-compressed.png';
// const String kWearMaskImageUrl = 'https://i.ibb.co/qYw7GRf/new-wear-mask-compressed.png';

const String kDoctorSitImage = 'assets/images/doctor_sit.png';
const String kWearMaskImage = 'assets/images/wear_mask.png';
const String kWashHandsImage = 'assets/images/wash_hand.png';
const String kPhysicalDistancingkImage = 'assets/images/physical_distancing.png';
const String kPeopleSickImage = 'assets/images/sick.png';
const String kCovidSearchImage = 'assets/images/covid-search.png';
const String kDoctorStandImage = 'assets/images/doctor_stand.png';
