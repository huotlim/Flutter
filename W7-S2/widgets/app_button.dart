import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
    this.label, {
    super.key,
    required this.onTap,
    this.icon,
  });

  final IconData? icon;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon != null ? Icon(icon, size: 20) : const SizedBox.shrink(),
      label: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        elevation: 4,
        backgroundColor: Color.fromARGB(255, 255, 252, 252), // Adjust as needed
        foregroundColor: const Color.fromARGB(255, 0, 0, 0), // Text/icon color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded shape
        ),
      ),
    );
  }
}
