import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_auth_fss/model/notification_model.dart';
import 'package:product_auth_fss/model/reportmodel.dart';

class ReportService {
  final CollectionReference _reports = FirebaseFirestore.instance.collection("reports");

  Future<void> addReport (ReportModel reportModel) async {
    await _reports.add(reportModel.toJson());
  }
}