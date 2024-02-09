import 'dart:io';

import 'package:changpharma/components/tappable_card_widget.dart';
import 'package:changpharma/secret.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionPicker extends StatelessWidget {
  const PrescriptionPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return TappableCard(
      onTap: () async {
        final capturedImage = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 30,
        );
        if (capturedImage == null) return;
        final imageBytes = await capturedImage.readAsBytes();
        final multipartFile = MultipartFile.fromBytes(imageBytes);
        final scannedMedicinesResponse = await Dio(BaseOptions(
          receiveTimeout: const Duration(seconds: 60),
        )).post(
          API_URL,
          data: multipartFile.finalize(),
          options: Options(
            headers: {
              HttpHeaders.contentTypeHeader: "multipart/form-data",
              HttpHeaders.contentLengthHeader: imageBytes.lengthInBytes,
            },
          ),
        );
      },
      label: "Select prescription doc",
    );
  }
}
