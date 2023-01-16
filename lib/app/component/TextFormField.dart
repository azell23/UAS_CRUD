import 'package:flutter/material.dart';

class TextFormFieldCom extends StatelessWidget {
  TextFormFieldCom(this.label, this.hint, this.padding, this.isPassword,
      this.keyboardType, this.icon, this.iconButton, this.controller,
      {this.tap});
  final String label;
  final String hint;
  final double padding;
  final isPassword;
  final TextInputType keyboardType;
  final IconData icon;
  final Widget iconButton;
  final VoidCallback? tap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onTap: tap,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            prefixIcon:
                Padding(padding: EdgeInsets.all(padding), child: Icon(icon)),
            suffixIcon:
                Padding(padding: EdgeInsets.all(padding), child: iconButton),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
