import 'package:flutter/material.dart';

import '../consts/colors.dart';
class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.icon, required this.controller,
  });

  final String label;
  final Icon icon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: label=="Password"?true:false,
        decoration: InputDecoration(
          fillColor: ThemeColors.kFiledColor.withOpacity(0.2),
          filled: true,
          label: Text(label),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)
          ),
          suffixIcon:icon,

        ),
      ),
    );
  }
}
