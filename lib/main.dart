import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';
import 'package:barcode_scan/controllers/controllers.dart';
import 'package:barcode_scan/constants/constants.dart';
import 'package:barcode_scan/ui/components/components.dart';
import 'package:barcode_scan/helpers/helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put<AuthController>(AuthController());
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return GetBuilder<LanguageController>(
      builder: (languageController) => Loading(
        child: GetMaterialApp(
          translations: Localization(),
          locale: languageController.getLocale, // <- Current locale
          navigatorObservers: [
            // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
          ],
          debugShowCheckedModeBanner: false,
          //defaultTransition: Transition.fade,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: "/",
          getPages: AppRoutes.routes,
        ),
      ),
    );
  }
}

// ignore: prefer_const_declarations
//final String repoURL = 'https://github.com/glorylab/wave';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   double marginHorizontal = 16.0;

//   _buildCard({
//     required Config config,
//     Color? backgroundColor = Colors.transparent,
//     DecorationImage? backgroundImage,
//     double height = 152.0,
//   }) {
//     return Container(
//       height: height,
//       width: double.infinity,
//       child: Card(
//         elevation: 12.0,
//         margin: EdgeInsets.only(
//             right: marginHorizontal, left: marginHorizontal, bottom: 16.0),
//         clipBehavior: Clip.antiAlias,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(16.0))),
//         child: WaveWidget(
//           config: config,
//           backgroundColor: backgroundColor,
//           backgroundImage: backgroundImage,
//           size: const Size(double.infinity, double.infinity),
//           waveAmplitude: 0,
//         ),
//       ),
//     );
//   }

//   String _scanBarcode = 'Unknown';

//   @override
//   void initState() {
//     super.initState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: const Text('Barcode scan')),
//       body: Builder(
//         builder: (BuildContext context) {
//           return Container(
//             alignment: Alignment.center,
//             child: Flex(
//               direction: Axis.vertical,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                     onPressed: () => scanBarcodeNormal(),
//                     child: const Text('Start barcode scan')),
//                 Text('Scan result : $_scanBarcode\n',
//                     style: const TextStyle(fontSize: 20))
//               ],
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }

//   void _launchUrl(url) async {
//     if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
//   }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//           title: const Text("Wave Clipper Design"),
//           backgroundColor: Colors.deepPurple),
//       body: Container(
//           child: Stack(
//         children: <Widget>[
//           //stack overlaps widgets
//           Opacity(
//             //semi red clippath with more height and with 0.5 opacity
//             opacity: 0.5,
//             child: ClipPath(
//               clipper: WaveClipper(), //set our custom wave clipper
//               child: Container(
//                 color: const Color.fromARGB(255, 200, 153, 208),
//                 height: 500,
//               ),
//             ),
//           ),

//           ClipPath(
//             //upper clippath with less height
//             clipper: WaveClipper(), //set our custom wave clipper.
//             child: Container(
//                 padding: const EdgeInsets.only(bottom: 50),
//                 color: Colors.deepPurple,
//                 height: 460,
//                 alignment: Alignment.center,
//                 child: const Text(
//                   "Wave clipper",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 )),
//           ),
//         ],
//       )));
// }

//   // @override
//   // Widget build(BuildContext context) {
//   //   marginHorizontal = 16.0 +
//   //       (MediaQuery.of(context).size.width > 512
//   //           ? (MediaQuery.of(context).size.width - 512) / 2
//   //           : 0);
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text(widget.title!),
//   //       elevation: 2.0,
//   //       actions: [
//   //         IconButton(
//   //           onPressed: () {
//   //             _launchUrl(repoURL);
//   //           },
//   //           icon: Image.asset(
//   //             'icons/ic_github.png',
//   //             package: 'web3_icons',
//   //             width: 32.0,
//   //             height: 32.0,
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //     body: Column(
//   //       children: [
//   //         Expanded(
//   //           child: ListView(
//   //             children: <Widget>[
//   //               const SizedBox(height: 16.0),
//   //               _buildCard(
//   //                 backgroundColor: Colors.purpleAccent,
//   //                 config: CustomConfig(
//   //                   gradients: [
//   //                     [Colors.red, const Color(0xEEF44336)],
//   //                     [Colors.red[800]!, const Color(0x77E57373)],
//   //                     [Colors.orange, const Color(0x66FF9800)],
//   //                     [Colors.yellow, const Color(0x55FFEB3B)]
//   //                   ],
//   //                   durations: [35000, 19440, 10800, 6000],
//   //                   heightPercentages: [0.20, 0.23, 0.25, 0.30],
//   //                   gradientBegin: Alignment.bottomLeft,
//   //                   gradientEnd: Alignment.topRight,
//   //                 ),
//   //               ),
//   //               _buildCard(
//   //                 height: 256.0,
//   //                 backgroundImage: const DecorationImage(
//   //                   image: NetworkImage(
//   //                     'https://images.unsplash.com/photo-1554779147-a2a22d816042?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3540',
//   //                   ),
//   //                   fit: BoxFit.cover,
//   //                   colorFilter:
//   //                       ColorFilter.mode(Colors.white, BlendMode.softLight),
//   //                 ),
//   //                 config: CustomConfig(
//   //                   colors: [
//   //                     Colors.pink[400]!,
//   //                     Colors.pink[300]!,
//   //                     Colors.pink[200]!,
//   //                     Colors.pink[100]!
//   //                   ],
//   //                   durations: [18000, 8000, 5000, 12000],
//   //                   heightPercentages: [0.85, 0.86, 0.88, 0.90],
//   //                 ),
//   //               ),
//   //               _buildCard(
//   //                   config: CustomConfig(
//   //                     colors: [
//   //                       Colors.white70,
//   //                       Colors.white54,
//   //                       Colors.white30,
//   //                       Colors.white24,
//   //                     ],
//   //                     durations: [32000, 21000, 18000, 5000],
//   //                     heightPercentages: [0.25, 0.26, 0.28, 0.31],
//   //                   ),
//   //                   backgroundColor: Colors.blue[600]),
//   //               Align(
//   //                 child: Container(
//   //                   height: 128,
//   //                   width: 128,
//   //                   decoration:
//   //                       const BoxDecoration(shape: BoxShape.circle, boxShadow: [
//   //                     BoxShadow(
//   //                       color: Color(0xFF9B5DE5),
//   //                       blurRadius: 2.0,
//   //                       spreadRadius: -5.0,
//   //                       offset: Offset(0.0, 8.0),
//   //                     ),
//   //                   ]),
//   //                   child: ClipOval(
//   //                     child: WaveWidget(
//   //                       config: CustomConfig(
//   //                         colors: [
//   //                           const Color(0xFFFEE440),
//   //                           const Color(0xFF00BBF9),
//   //                         ],
//   //                         durations: [
//   //                           5000,
//   //                           4000,
//   //                         ],
//   //                         heightPercentages: [
//   //                           0.65,
//   //                           0.66,
//   //                         ],
//   //                       ),
//   //                       backgroundColor: const Color(0xFFF15BB5),
//   //                       size: const Size(double.infinity, double.infinity),
//   //                       waveAmplitude: 0,
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ),
//   //               const SizedBox(
//   //                 height: 88,
//   //               ),
//   //               Container(
//   //                   alignment: Alignment.center,
//   //                   margin: const EdgeInsets.all(16),
//   //                   child: Column(
//   //                     children: [
//   //                       Image.asset(
//   //                         'icons/ic_glory_lab.png',
//   //                         package: 'web3_icons',
//   //                         width: 32.0,
//   //                         height: 32.0,
//   //                       ),
//   //                       const SizedBox(height: 8),
//   //                       Text(
//   //                         'Made in Glory Lab',
//   //                         style: GoogleFonts.robotoMono(
//   //                           color: Colors.grey[500],
//   //                         ),
//   //                       )
//   //                     ],
//   //                   )),
//   //               Container(
//   //                 height: 48,
//   //                 child: WaveWidget(
//   //                   config: CustomConfig(
//   //                     colors: [
//   //                       Colors.indigo[400]!,
//   //                       Colors.indigo[300]!,
//   //                       Colors.indigo[200]!,
//   //                       Colors.indigo[100]!
//   //                     ],
//   //                     durations: [18000, 8000, 5000, 12000],
//   //                     heightPercentages: [0.65, 0.66, 0.68, 0.70],
//   //                   ),
//   //                   size: const Size(double.infinity, double.infinity),
//   //                   waveAmplitude: 0,
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }

// //Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(
      0,
      size.height,
    ); //start path with this if you are making at bottom
    var firstStart = Offset(
      size.width / 5,
      size.height,
    ); //fist point of quadratic bezier curve
    var firstEnd = Offset(
      size.width / 2.25,
      size.height - 50.0,
    ); //second point of quadratic bezier curve
    path.quadraticBezierTo(
      firstStart.dx,
      firstStart.dy,
      firstEnd.dx,
      firstEnd.dy,
    );
    var secondStart = Offset(
      size.width - (size.width / 3.24),
      size.height - 105,
    ); //third point of quadratic bezier curve
    var secondEnd = Offset(
      size.width,
      size.height - 10,
    ); //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
      secondStart.dx,
      secondStart.dy,
      secondEnd.dx,
      secondEnd.dy,
    );

    path.lineTo(
      size.width,
      0,
    ); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
