import 'package:flutter/material.dart';
import '../models/dice.dart';
import '../models/scorecard.dart';
import 'dice_display.dart';
import 'ScorecardDisplay.dart';
import 'RollButton.dart';

class Yahtzee extends StatefulWidget {
  const Yahtzee({super.key});

  @override
  State<Yahtzee> createState() => _YahtzeeState();
}

class _YahtzeeState extends State<Yahtzee> {
  final Dice _dice = Dice(5); // Initialize with 5 dice
  final ScoreCard _scoreCard = ScoreCard();
  int _rollCount = 0;
  int _totalScore = 0;

  void _rollDice() {
    if (_rollCount < 3) {
      setState(() {
        _dice.roll();
        _rollCount++;
      });
    }
  }

  void _toggleHold(int index) {
    setState(() {
      _dice.toggleHold(index);
    });
  }

  void _selectCategory(ScoreCategory category) {
    if (_scoreCard[category] == null) {
      setState(() {
        _scoreCard.registerScore(category, _dice.values);
        _totalScore = _scoreCard.total;
        _dice.clear(); // Clear dice after selecting a category
        _rollCount = 0; // Reset roll count

        // Check if all categories are completed
        if (_scoreCard.completed) {
          _showFinalScore();
        }
      });
    }
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Game Over'),
        content: Text('Your final score is $_totalScore'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                // Reset game state
                _dice.clear();
                _scoreCard.clear();
                _rollCount = 0;
                _totalScore = 0;
              });
              Navigator.of(context).pop();
            },
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yahtzee')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DiceDisplay(dice: _dice, onToggleHold: _toggleHold),
          SizedBox(height: 25),
          RollButton(onRollDice: _rollDice, rollCount: _rollCount),
          SizedBox(height: 25),
          ScorecardDisplay(scoreCard: _scoreCard, onSelectCategory: _selectCategory),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Current score: $_totalScore'),
          ),
        ],
      ),
    );
  }
}
