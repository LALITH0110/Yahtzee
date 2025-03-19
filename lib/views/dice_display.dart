import 'package:flutter/material.dart';
import '../models/dice.dart';

class DiceDisplay extends StatelessWidget {
  final Dice dice;
  final Function(int) onToggleHold;

  const DiceDisplay({super.key, required this.dice, required this.onToggleHold});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final value = dice[index];
        return GestureDetector(
          onTap: () => onToggleHold(index),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: dice.isHeld(index) ? Colors.red : Colors.black,
                width: 2.0,
              ),
            ),
            width: 48.0,
            height: 48.0,
            alignment: Alignment.center,
            child: Text(
              value != null ? value.toString() : '', // Show empty box if value is null
              style: const TextStyle(fontSize: 18),
            ),
          ),
        );
      }),
    );
  }
}
