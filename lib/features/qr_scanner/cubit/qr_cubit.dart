import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task1/core/services/local_storage/secure_keys.dart';
import '../../../core/services/local_storage/secure_storage.dart';
part 'qr_states.dart';

class QrCubit extends Cubit<QrStates> {
  QrCubit() : super(QrInitial());
  static QrCubit get(context) => BlocProvider.of(context);
  late CameraController controller;
  bool isFlashOn = false;
  final SecureStorage secureStorage = SecureStorage();

  Future<void> saveScannedCode(String code) async {
    try {
      List<String> savedCodes = await getSavedCodes();
      savedCodes.add(code);
      await secureStorage.setSecureData(SecureKeys.scannedCodes, savedCodes.join(','));
      emit(QrCodesSuccessful(savedCodes));
    } catch (e) {
      emit(QrErrorState('Failed to save code'));
    }
  }

  Future<void> loadSavedCodes() async {
    try {
      List<String> savedCodes = await getSavedCodes();
      emit(QrCodesSuccessful(savedCodes));
    } catch (e) {
      emit(QrErrorState('Failed to load codes'));
    }
  }

  Future<List<String>> getSavedCodes() async {
    String? data = await secureStorage.getSecureData(SecureKeys.scannedCodes);
    return data?.split(',') ?? [];
  }

  void initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await controller.initialize();
  }

  void toggleFlash() {
    isFlashOn = !isFlashOn;
    controller.setFlashMode(
      isFlashOn ? FlashMode.torch : FlashMode.off,
    );

    if (isFlashOn) {
      emit(QrScannerFlashOn());
    } else {
      emit(QrScannerFlashOff());
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }


/*  void galleryImage() async {
    emit(PickPhotoLoading());
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imageGallery =
      await picker.pickImage(source: ImageSource.gallery);
      if (imageGallery != null) {
        // Read QR code from the picked image
        ScanResult result = await BarcodeScanner.scan(
          imageGallery.path,
          options: const ScanOptions(
            restrictFormat: [BarcodeFormat.qr],
          ),
        );

        String scannedCode = result.rawContent;

        // Emit success state with scanned code
        emit(QrCodesSuccessful([scannedCode]));
      }

      emit(PickPhotoSuccess());
    } catch (e) {
      emit(QrErrorState('Error while capturing photo: $e'));
    }
  }*/
}

