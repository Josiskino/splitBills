import 'package:flutter/cupertino.dart';

class BottomFixedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final double buttonVerticalPadding;
  final double fontSize;
  final FontWeight fontWeight;

  const BottomFixedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = CupertinoColors.systemBlue,
    this.textColor = CupertinoColors.white,
    this.buttonVerticalPadding = 14.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: CupertinoColors.systemBackground,
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          top: false,
          child: CupertinoButton(
            padding: EdgeInsets.symmetric(vertical: buttonVerticalPadding),
            color: buttonColor,
            borderRadius: BorderRadius.circular(12),
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}