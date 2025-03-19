import 'package:flutter/material.dart';
import '../models/scorecard.dart';

class ScorecardDisplay extends StatelessWidget {
  final ScoreCard scoreCard;
  final Function(ScoreCategory) onSelectCategory;

  const ScorecardDisplay({super.key, required this.scoreCard, required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding around the table
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2), // Adjust width for category names
          1: FlexColumnWidth(1), // Adjust width for scores or "Pick"
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: ScoreCategory.values.map((category) {
          final score = scoreCard[category];
          return TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 150), // Add consistent left padding
                child: Align(
                  alignment: Alignment.centerLeft, // Align text to the left within the cell
                  child: Text(
                    category.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50), // Add consistent left padding
                child: Align(
                  alignment: Alignment.centerLeft, // Align text to the left within the cell
                  child: GestureDetector(
                  onTap: score == null ? () => onSelectCategory(category) : null,
                  child: Text(
                    score?.toString() ?? "Pick",
                    style: TextStyle(
                      color: score == null ? Colors.blue : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
