class NotificationModel {
  final String? title;
  final String? content;
  final String? qrData;
  final String? usedID;
  final String? userEmail;

  NotificationModel( {required this.title, required this.content,required this.qrData,required this.usedID,required this.userEmail});

  Map<String,dynamic> toMap(){
    return {
      "Title":title,
      "Content":content,
      "qrData":qrData,
      "userID":usedID,
      "userEmail":userEmail,
    };
  }
}