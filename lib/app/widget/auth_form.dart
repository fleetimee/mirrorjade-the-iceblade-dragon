import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AuthForm extends StatefulWidget {
  final TextEditingController ctrl;
  final String hint;
  final String? Function(String?)? validator;
  final String name;
  final bool obscureText;
  final Icon prefixIcon;

  const AuthForm({
    super.key,
    required this.ctrl,
    this.validator,
    required this.name,
    this.obscureText = false,
    required this.hint,
    required this.prefixIcon,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      controller: widget.ctrl,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        filled: true,
        fillColor: Colors.grey.shade300,
        hintText: widget.hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      validator: widget.validator,
      obscureText: widget.obscureText,
    );
  }
}
