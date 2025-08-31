import 'package:flutter/material.dart';

class Scoreboard extends StatelessWidget {
  final int scoreX;
  final int scoreO;
  final int scoreDraw;

  const Scoreboard({
    super.key,
    required this.scoreX,
    required this.scoreO,
    required this.scoreDraw,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ScoreBox(label: 'X', score: scoreX, color: Colors.blue),
        _ScoreBox(label: 'O', score: scoreO, color: Colors.red),
        _ScoreBox(label: 'Draw', score: scoreDraw, color: Colors.grey),
      ],
    );
  }
}

class _ScoreBox extends StatelessWidget {
  final String label;
  final int score;
  final Color color;

  const _ScoreBox({
    required this.label,
    required this.score,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          score.toString(),
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
