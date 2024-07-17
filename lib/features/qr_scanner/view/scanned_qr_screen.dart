import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1/core/buttons.dart';
import 'package:task1/features/qr_scanner/cubit/qr_cubit.dart';
import 'package:task1/features/qr_scanner/view/qr_scanner_screen_components.dart';

class ScannedCodesScreen extends StatelessWidget {
  const ScannedCodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = QrCubit.get(context);
    cubit.loadSavedCodes();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:const BackBtn(
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           //SizedBox(height: 40.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                qrScreenHeader(context),
                SizedBox(height: 30.h),
                qrScreenHead2(context),

                BlocBuilder<QrCubit, QrStates>(
                  builder: (context, state) {
                    if (state is QrInitial) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is QrErrorState) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else if (state is QrCodesSuccessful) {
                      if (state.codes.isEmpty) {
                        return const Center(child: Text('No scanned codes found'));
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: state.codes.map((code) => ScannedCodeItemList(code: code)).toList(),
                        );
                      }
                    }
                    return const Center(child: Text('Unknown state'));
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 15.h, 30.w, 16.h),
            child: DefaultButton(
              text1: 'Send',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}