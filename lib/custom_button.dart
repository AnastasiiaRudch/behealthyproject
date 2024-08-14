import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: isSelected ? Colors.grey : Colors.grey.shade200, shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        ),
        child: Text(text),
      ),
    );
  }
}
