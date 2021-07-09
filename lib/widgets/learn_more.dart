// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../constant.dart';

// class LearnMore extends StatelessWidget {
//   const LearnMore({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(
//         bottom: 30,
//         left: kDefaultPadding,
//         right: kDefaultPadding,
//       ),
//       height: 150,
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(12),
//         image: DecorationImage(
//           image: AssetImage('assets/images/virus.png'),
//         ),
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.grey.withOpacity(0.3),
//         //     blurRadius: 5,
//         //   ),
//         // ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 18),
//             child: SvgPicture.asset(
//               'assets/icons/coronadr.svg',
//               width: 75,
//               fit: BoxFit.contain,
//               alignment: Alignment.bottomLeft,
//             ),
//           ),
//           SizedBox(width: 20),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Pelajari lebih lanjut mengenai \nCOVID-19\n#StayHome',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                 ),
//               ),
//               SizedBox(height: 15),
//               GestureDetector(
//                 onTap: _launchURL,
//                 child: Container(
//                   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Text(
//                     'Read more',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// _launchURL() async {
//   const url = kCoronaVirusInfoUrl;
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
