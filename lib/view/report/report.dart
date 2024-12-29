import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_auth_fss/consts/app_style.dart';
import 'package:product_auth_fss/controller/reportcontroller.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportController reportController = Get.put(ReportController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report an Issue"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0, left: 18, right: 18),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subject of the Report",
                style: AppStyle.specificCaseStyle,
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a subject for the report.";
                  }
                  return null;
                },
                controller: reportController.reportTitle.value,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xffD0D5DD),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffD0D5DD),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter the subject of your report",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Details of the Issue",
                style: AppStyle.specificCaseStyle,
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please provide details of the issue.";
                  }
                  return null;
                },
                controller: reportController.reportDesc.value,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xffD0D5DD),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffD0D5DD),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Describe the issue in detail",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await reportController.sendReport(
                        reportController.reportTitle.value.text,
                        reportController.reportDesc.value.text,
                      );
                    }
                  },
                  child: const Text("Submit Report"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
