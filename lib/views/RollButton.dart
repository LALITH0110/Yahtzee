import 'package:flutter/material.dart';

class RollButton extends StatelessWidget {
  final VoidCallback onRollDice;
  final int rollCount;

  const RollButton({super.key, required this.onRollDice, required this.rollCount});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: rollCount < 3 ? onRollDice : null,
      child: Text('Roll (${3 - rollCount})'),
    );
  }
}
