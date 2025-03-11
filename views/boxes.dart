import 'package:flutter/material.dart';

class Boxes extends StatefulWidget {
  const Boxes({super.key});

  @override
  State<Boxes> createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  // List to track whether each dice is held (clicked)
  final List<bool> _isHeld = List<bool>.filled(5, false);

  // Toggle the hold status of a dice when clicked
  void _toggleHold(int index) {
    setState(() {
      _isHeld[index] = !_isHeld[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => _toggleHold(index), // Handle click event
          child: Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: _isHeld[index]
                    ? Colors.red // Highlight with red border if held
                    : Colors.black, // Default black border if not held
                width: 2.0,
              ),
            ),
            width: 48.0,
            height: 48.0,
          ),
        );
      }),
    );
  }
}
