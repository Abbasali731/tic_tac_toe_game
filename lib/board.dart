import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  final List<String?> board;
  final void Function(int) onTap;
  final List<int>? winningLine;

  const Board({
    super.key,
    required this.board,
    required this.onTap,
    this.winningLine,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final isWinningCell = winningLine?.contains(index) ?? false;

          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isWinningCell
                    ? Colors.green.shade300
                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  board[index] ?? '',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: board[index] == 'X'
                        ? Colors.blue
                        : board[index] == 'O'
                            ? Colors.red
                            : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
