import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.onChanged,
    this.hintText,
    this.obscureAllowed = false,
  });
  final Function(String)? onChanged;
  final String? hintText;
  final bool obscureAllowed;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 15,
        ),
        filled: true,

        fillColor: const Color(0xFFE8ECF4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: widget.obscureAllowed == true
            ? IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : null,
      ),
      obscureText: widget.obscureAllowed ? obscureText : false,
      onChanged: widget.onChanged,
    );
  }
}
