part of 'qr_cubit.dart';

sealed class QrStates {}

final class QrInitial extends QrStates {}

class QrScannerInitial extends QrStates {}
class QrScannerFlashOn extends QrStates {}
class QrScannerFlashOff extends QrStates {}



class QrCodesSuccessful extends QrStates {
  final List<String> codes;
  QrCodesSuccessful(this.codes);
}
class QrErrorState extends QrStates {
  final String message;
  QrErrorState(this.message);
}


class PickPhotoLoading extends QrStates {}
class PickPhotoSuccess extends QrStates {}


