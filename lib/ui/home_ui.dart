import 'package:flutter/material.dart';
import 'package:barcode_scan/controllers/controllers.dart';
import 'package:barcode_scan/ui/components/components.dart';
import 'package:barcode_scan/ui/ui.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class HomeUI extends StatefulWidget {
  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  String _scanBarcode = 'Unknown';
  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      //print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => controller.firestoreUser.value!.uid == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: AppBar(
                title: Text('home.title'.tr),
                actions: [
                  IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Get.to(SettingsUI());
                      }),
                ],
              ),
              body: Stack(
                children: <Widget>[
                  //stack overlaps widgets
                  Opacity(
                    //semi red clippath with more height and with 0.5 opacity
                    opacity: 0.5,
                    child: ClipPath(
                      clipper: WaveClipper(), //set our custom wave clipper
                      child: Container(
                        color: const Color.fromARGB(255, 200, 153, 208),
                        height: 500,
                      ),
                    ),
                  ),
                  ClipPath(
                    //upper clippath with less height
                    clipper: WaveClipper(), //set our custom wave clipper.
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 50),
                      color: Colors.deepPurple,
                      height: 460,
                      alignment: Alignment.center,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 120),
                        Avatar(controller.firestoreUser.value!),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FormVerticalSpace(),
                            Text(
                                '${'home.nameLabel'.tr}: ${controller.firestoreUser.value!.name}',
                                style: const TextStyle(fontSize: 16)),
                            FormVerticalSpace(),
                            Text(
                                '${'home.emailLabel'.tr}: ${controller.firestoreUser.value!.email}',
                                style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                        FormVerticalSpace(),
                        Builder(
                          builder: (BuildContext context) {
                            return Container(
                              alignment: Alignment.center,
                              child: Flex(
                                direction: Axis.vertical,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () => scanBarcodeNormal(),
                                    child: Text('barcode.scan'.tr),
                                  ),
                                  Text('Scan result : $_scanBarcode\n',
                                      style: const TextStyle(fontSize: 16))
                                ],
                              ),
                            );
                          },
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
