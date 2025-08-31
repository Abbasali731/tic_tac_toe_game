import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'board.dart';
import 'scoreboard.dart';
import 'game_logic.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String?> board = List.filled(9, null);
  String currentPlayer = 'X';
  String? winner;
  List<int>? winningLine;
  int scoreX = 0;
  int scoreO = 0;
  int scoreDraw = 0;

  void handleTap(int index) {
    if (board[index] != null || winner != null) return;
    setState(() {
      board[index] = currentPlayer;
      final winLine = checkWinner(board);
      if (winLine != null) {
        winner = currentPlayer;
        winningLine = winLine;
        if (winner == 'X') {
          scoreX++;
        } else {
          scoreO++;
        }
      } else if (isDraw(board)) {
        winner = 'Draw';
        scoreDraw++;
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    });
  }

  void restartGame() {
    setState(() {
      board = List.filled(9, null);
      winner = null;
      winningLine = null;
      currentPlayer = 'X';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tic Tac Toe',
              style: GoogleFonts.poppins(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 20),
            Scoreboard(scoreX: scoreX, scoreO: scoreO, scoreDraw: scoreDraw),
            const SizedBox(height: 20),

            // 👇 Current Player Indicator
            if (winner == null)
              Text(
                'Player $currentPlayer\'s Turn',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: currentPlayer == 'X' ? Colors.blue : Colors.red,
                ),
              ),

            const SizedBox(height: 20),
            Board(board: board, onTap: handleTap, winningLine: winningLine),
            const SizedBox(height: 30),
            if (winner != null)
              Text(
                winner == 'Draw' ? 'It\'s a Draw!' : '$winner Wins!',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: winner == 'Draw'
                      ? Colors.grey.shade700
                      : Colors.green.shade600,
                ),
              ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              ),
              onPressed: restartGame,
              icon: const Icon(Icons.refresh),
              label: const Text(
                'Restart',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
