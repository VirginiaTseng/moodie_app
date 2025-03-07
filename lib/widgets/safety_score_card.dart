import 'package:flutter/material.dart';

class SafetyScoreCard extends StatelessWidget {
  final int score;
  final String label;
  
  const SafetyScoreCard({
    Key? key, 
    required this.score,
    required this.label,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.shield, color: Colors.white, size: 30),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
        Text(
          '$score %',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}