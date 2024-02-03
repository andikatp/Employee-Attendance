// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatefulWidget {
  final String text;
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType inputType;
  final bool password;
  final String? Function(String?)? validator;
  const CustomTextfield({
    required this.text,
    required this.hintText,
    required this.textEditingController,
    required this.validator,
    super.key,
    this.inputType = TextInputType.text,
    this.password = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 5.h,
        children: [
          Text(widget.text, style: theme.textTheme.bodyLarge),
          TextFormField(
            controller: widget.textEditingController,
            keyboardType: widget.inputType,
            obscureText: _obsecureText && widget.password,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade500),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
                borderSide: BorderSide(
                  color: theme.primaryColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
                borderSide: BorderSide(color: theme.primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
                borderSide: BorderSide(color: theme.primaryColor),
              ),
              suffixIcon: widget.password
                  ? TextButton(
                      onPressed: () =>
                          setState(() => _obsecureText = !_obsecureText),
                      child: Text(
                        'Lihat',
                        style: TextStyle(color: theme.primaryColor),
                      ),
                    )
                  : null,
              contentPadding: REdgeInsets.symmetric(horizontal: 10),
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500),
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
