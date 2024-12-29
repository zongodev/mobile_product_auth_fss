import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:product_auth_fss/model/reportmodel.dart';
import 'package:product_auth_fss/services/reportservice.dart';
import 'package:flutter/material.dart';

class ReportController extends GetxController{
  final Rx<TextEditingController> reportTitle = TextEditingController().obs;
  final Rx<TextEditingController> reportDesc = TextEditingController().obs;
  final ReportService reportService = ReportService();
  Future<void> sendReport(String reportTitle,String reportDesc) async {
    ReportModel report = ReportModel(reportTitle: reportTitle, reportDesc: reportDesc


    );
    try {
      await reportService.addReport(report).then((value) {
        this.reportTitle.value.clear();
        this.reportDesc.value.clear();
        return Get.snackbar("Success", "A report sent , thank you",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 7),
            icon: const Icon(
              Icons.check,
              color: Colors.white,
              size: 40,
            ),
            maxWidth: 500,
            margin: const EdgeInsets.only(bottom: 10),
            backgroundColor: Colors.green,
            colorText: Colors.white);
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          maxWidth: 500,
          margin: const EdgeInsets.only(bottom: 10),
          backgroundColor: const Color(0xffE6284A),
          colorText: Colors.white);
    }
  }
}