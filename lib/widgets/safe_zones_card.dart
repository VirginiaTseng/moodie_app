import 'package:flutter/material.dart';

class SafeZonesCard extends StatelessWidget {
  final int count;
  final String label;
  final String zonesLabel;
  
  const SafeZonesCard({
    Key? key, 
    required this.count,
    required this.label,
    required this.zonesLabel,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.location_on, color: Colors.white, size: 30),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
        Text(
          '$count $zonesLabel',
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