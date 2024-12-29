import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_auth_fss/model/notification_model.dart';

class NotificationService {
  final CollectionReference _notification = FirebaseFirestore.instance.collection("notification");
  
  Future<void> addNotification (NotificationModel notification) async {
    await _notification.add(notification.toMap());
  }
}