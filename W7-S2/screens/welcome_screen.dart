import 'package:flutter/material.dart';
import 'package:flutter_project/W7-S2/widgets/app_button.dart';// Adjust the path based on your folder structure

class WelcomeScreen extends StatelessWidget {
  final String quizTitle;
  final VoidCallback onStart;

  // Replace this with the actual URL of your image
  final String quizImageUrl = 'https://play-lh.googleusercontent.com/eeK-UGB2xjgZvGc2-BddbEDaj3hH1MB_MGuNN7w4nj1MnkXcmHPBjMiBSdVryEgW9Uc';

  const WelcomeScreen({
    super.key,
    required this.quizTitle,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 228, 236, 241), // Adjust background color for better contrast
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                quizImageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator(); // Loader while image is loading
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.family_restroom_outlined,
                    size: 100,
                    color: Color.fromARGB(255, 239, 241, 242),
                  ); // Error icon if image fails to load
                },
              ),
              const SizedBox(height: 20),
              Text(
                quizTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              // Use the AppButton widget
              AppButton(
                "Start Quiz",
                icon: Icons.arrow_right_alt,
                onTap: onStart,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
