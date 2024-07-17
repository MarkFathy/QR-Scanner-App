import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:task1/core/buttons.dart';
import 'package:task1/core/colors.dart';
import 'package:task1/core/text_styles.dart';
import 'package:task1/features/qr_scanner/cubit/qr_cubit.dart';
import 'package:task1/features/qr_scanner/view/scanned_qr_screen.dart';

class QrScannerScreen extends StatelessWidget {
  QrScannerScreen({super.key});

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = QrCubit.get(context);
    cubit.initializeCamera();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Scan QR code',
                style: AppStyles.textStyle19,
              ),
            ),
            SizedBox(height: 40.h),
            Center(
              child: Text(
                'Place Qr code inside the frame to scan \n      '
                'avoid shake to get results quickly',
                style: AppStyles.textStyle14,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              height: 200.h,
              width: 200.w,
              child: MobileScanner(
                controller: MobileScannerController(
                  detectionSpeed: DetectionSpeed.noDuplicates,
                  returnImage: true,
                ),
                onDetect: (capture) async {
                  final List<Barcode> barcodes = capture.barcodes;
                  //final Uint8List? image = capture.image;

                  if (barcodes.isNotEmpty) {
                    final String scannedCode = barcodes.first.rawValue ?? '';

                    await cubit.saveScannedCode(scannedCode);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScannedCodesScreen(),
                      ),
                    );
                  }
                },
              ),
            ),
            BlocBuilder<QrCubit, QrStates>(
              builder: (context, state) {
                bool isFlashOn = state is QrScannerFlashOn;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                       // cubit.galleryImage();
                      },
                      icon:
                          Icon(Icons.image_rounded, color: MyColors.greyColor),
                    ),
                    IconButton(
                      onPressed: () {
                        cubit.toggleFlash();
                      },
                      icon: Icon(
                        isFlashOn ? Icons.flash_on : Icons.flash_off,
                        color: MyColors.greyColor,
                      ),
                    )
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.w, 15.h, 30.w, 0),
              child: DefaultButton(
                text1: 'Place Camera Code',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
