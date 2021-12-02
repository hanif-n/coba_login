import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    Key? key,
    this.padding = const EdgeInsets.all(10.0),
    required this.controller,
    required this.labelText,
    this.obscuretext = false,
    this.icon,
    this.prefixIcon,
    this.border = const OutlineInputBorder(),
  }) : super(key: key);

  final EdgeInsets padding;
  final TextEditingController controller;
  final String? labelText;
  final bool obscuretext;
  final IconData? icon;
  final IconData? prefixIcon;
  final InputBorder border;

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  
  bool _isTextHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscuretext ? _isTextHidden : false,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: widget.border,
          icon: widget.icon == null ? null : Icon(
            widget.icon,
          ),
          prefixIcon: widget.prefixIcon == null ? null : Icon(
            widget.prefixIcon,
          ),
          suffixIcon: widget.obscuretext ? _visibilityToggle() : null,
        ),
      ),
    );
  }

  Widget _visibilityToggle(){
    return GestureDetector(
      onTap : (){
        setState(() {
          _isTextHidden = !_isTextHidden;
        });
      },
      child: Icon(
        _isTextHidden ? Icons.visibility_off : Icons.visibility,
      ),
    );
  }
}