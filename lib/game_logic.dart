List<int>? checkWinner(List<String?> board) {
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  for (var line in lines) {
    final a = line[0], b = line[1], c = line[2];
    if (board[a] != null &&
        board[a] == board[b] &&
        board[a] == board[c]) {
      return line;
    }
  }
  return null;
}

bool isDraw(List<String?> board) {
  return !board.contains(null);
}
