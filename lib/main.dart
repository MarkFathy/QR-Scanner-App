import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1/features/qr_scanner/view/qr_scanner_screen.dart';
import 'core/services/local_storage/secure_storage.dart';
import 'features/qr_scanner/cubit/qr_cubit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<QrCubit>(
            create: (context) => QrCubit(),
          ),

        ],
        child:MaterialApp(
          debugShowCheckedModeBanner: false,
          home: QrScannerScreen(),
        ),
      ),
    );
  }
}
