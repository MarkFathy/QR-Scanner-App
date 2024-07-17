import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/core/colors.dart';

import '../../../core/text_styles.dart';

class ScannedCodeItemList extends StatelessWidget {
  final String code;

  const ScannedCodeItemList({required this.code, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: MyColors.greyColor2,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: const Icon(Icons.document_scanner, color: Colors.orange),
        title: SelectableText(
          code,
          onTap: () {
            Clipboard.setData(ClipboardData(text: code));
            /*ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Copied to clipboard: $code')),
            );*/
          },
          style: TextStyle(color: MyColors.blackColor, decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}

Widget qrScreenHeader(BuildContext context) => Center(
  child: Text(
    'Scanning Result',
    style: AppStyles.textStyle20,
  ),
);

Widget qrScreenHead2(BuildContext context) => Center(
  child: Text(
    'Proreader will keep your last 10 days history \n      '
        ' to keep your all saved history please \n'
             '                 purchase our pro package ',
    style: AppStyles.textStyle14,
  ),
);

