import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class UsersDetailForm extends StatefulWidget {
  final TextEditingController? ctrl;
  final String? initialValue;
  final String hint;
  final String? Function(String?)? validator;
  final String name;
  final bool obscureText;
  final Icon prefixIcon;
  final Widget? suffixIcon;

  const UsersDetailForm({
    super.key,
    this.ctrl,
    required this.hint,
    this.validator,
    required this.name,
    this.obscureText = false,
    required this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
  });

  @override
  State<UsersDetailForm> createState() => _UsersDetailFormState();
}

class _UsersDetailFormState extends State<UsersDetailForm> {
  bool isDarkMode = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      controller: widget.ctrl,
      initialValue: widget.initialValue,
      validator: widget.validator,
      readOnly: true,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: isDarkMode ? Colors.grey[900] : Colors.grey[200],
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class UsersDetailFormEditable extends StatefulWidget {
  final TextEditingController? ctrl;
  final String? initialValue;
  final String hint;
  final String? Function(String?)? validator;
  final String name;
  final bool obscureText;
  final Icon prefixIcon;
  final Widget? suffixIcon;

  const UsersDetailFormEditable({
    super.key,
    this.ctrl,
    this.initialValue,
    required this.hint,
    this.validator,
    required this.name,
    required this.obscureText,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  State<UsersDetailFormEditable> createState() =>
      _UsersDetailFormEditableState();
}

class _UsersDetailFormEditableState extends State<UsersDetailFormEditable> {
  bool isDarkMode = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      controller: widget.ctrl,
      initialValue: widget.initialValue,
      validator: widget.validator,
      readOnly: false,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: isDarkMode ? Colors.grey[900] : Colors.grey[200],
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
