import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UsersDetailForm extends StatefulWidget {
  final TextEditingController? ctrl;
  final String? initialValue;
  final String hint;
  final String? Function(String?)? validator;
  final String name;
  final bool obscureText;
  final Icon prefixIcon;
  final Widget suffixIcon;

  const UsersDetailForm({
    super.key,
    this.ctrl,
    required this.hint,
    this.validator,
    required this.name,
    this.obscureText = false,
    required this.prefixIcon,
    required this.suffixIcon,
    this.initialValue,
  });

  @override
  State<UsersDetailForm> createState() => _UsersDetailFormState();
}

class _UsersDetailFormState extends State<UsersDetailForm> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      controller: widget.ctrl,
      initialValue: widget.initialValue,
      validator: widget.validator,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: Colors.grey.shade300,
        hintText: widget.hint,
        border: InputBorder.none,
      ),
    );
  }
}
