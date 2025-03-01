import 'package:flutter/material.dart';

class SafetyScoreCard extends StatelessWidget {
  final int score;
  
  const SafetyScoreCard({Key? key, required this.score}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.shield, color: Colors.white, size: 30),
        const SizedBox(height: 8),
        Text(
          '安全分数',
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