import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.variant = 'primary',
    required this.onClick,
    this.titleStyle,
    this.icon,
    this.iconColor,
    this.isLoading,
  });

  final String title;
  final String? variant;
  final void Function() onClick;
  final TextStyle? titleStyle;
  final IconData? icon;
  final Color? iconColor;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: variant == 'primary'
            ? Color(0xFF81B622)
            : variant == 'error'
            ? Color(0xFFC11000)
            : Color(0xFFF5F5F5),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onClick,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Icon(icon, color: iconColor ?? Colors.white)
              : SizedBox(),
          icon != null
              ? SizedBox(width: MediaQuery.of(context).size.width * 0.01)
              : SizedBox(),
          isLoading != null
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : Text(title, style: titleStyle),
        ],
      ),
    );
  }
}
