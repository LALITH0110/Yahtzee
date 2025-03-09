import 'package:flutter/material.dart';
import 'views/yahtzee.dart';

void main() {
  runApp(const MaterialApp(
    title: "Lalith's Yahtzee",
    home: Scaffold(
      body: Yahtzee()
    ),
  ));
}
