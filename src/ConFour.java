import java.util.Scanner;

public class ConFour {
  private static final int ROWS = 6;
  private static final int COLS = 7;
  private static final char EMPTY = '-';
  private static final char PLAYER1 = 'X';
  private static final char PLAYER2 = 'O';
  private char[][] board;
  private int currentPlayer;
  public ConFour() {
    board = new char[ROWS][COLS];
    currentPlayer = 1;
    initializeBoard();
  }

  private void initializeBoard() {
    for (int i = 0; i < ROWS; i++) {
      for (int j = 0; j < COLS; j++) {
      board[i][j] = EMPTY;
      }
    }
  }

  private void printBoard() {
    for (int i = 0; i < ROWS; i++) {
      for (int j = 0; j < COLS; j++) {
      System.out.print(board[i][j] + " ");
      }
    System.out.println();
    }
  System.out.println("1 2 3 4 5 6 7");
  }

  private boolean dropToken(int col) {
    for (int i = ROWS - 1; i >= 0; i--) {
      if (board[i][col] == EMPTY) {
        board[i][col] = (currentPlayer == 1) ? PLAYER1 : PLAYER2;
        return true;
      }
    }
    return false;
  }

  private boolean checkWin() {
    return checkRows() || checkColumns() || checkDiagonals();
  }
  private boolean checkRows() {
  for (int row = 0; row < ROWS; row++) {
      int Streak = 0;
      char CurrentPlayer = 'X';
      for (int col = 0; col < COLS; col++) {
        if (col == 0) {
          CurrentPlayer = board[row][col];
        }
        if (board[row][col] == CurrentPlayer && CurrentPlayer!='-') {
          Streak += 1;
        } else {
          Streak = 1;
          CurrentPlayer = board[row][col];
        }
        if (Streak >= 4) {
          return true;
        }
      }
    }
    return false;
  }

  private boolean checkColumns() {
    for(int i = 0; i < 7; i++) { // For columns
      String perCol = "";
      for(int t = 0; t < ROWS; t++) { // For rows
        perCol += board[t][i];
      }
      if (perCol.contains("XXXX") || perCol.contains("OOOO")) {
        return true;
      }
    }
    return false;
  }

  private boolean checkDiagonals() {
    for (int i = 0; i<ROWS-3; i++){
      for (int j = 0; j<COLS-3; j++ ){
        if (board[i][j] != '-' && board[i][j] == board[i+1][j+1] && board[i+1][j+1] == board[i+2][j+2] && board[i+2][j+2] == board[i+3][j+3]){
          return true;
        }
      }
    }
    for (int i = 0; i>ROWS-3; i++){
      for (int j = 3; j<COLS; j++){
        if (board[i][j] != '-' && board[i][j] == board[i+1][j-1] && board[i+1][j-1] == board[i+2][j-2] && board[i+2][j-2] == board[i+3][j-3]){
          return true;
        }
      }
    }
    return false;
  }

  private boolean isBoardFull() {
    for (int i = 0; i < ROWS; i++) {
      for (int j = 0; j < COLS; j++) {
        if (board[i][j] == EMPTY) {
          return false;
        }
      }
    }
    return true;
  }

  public void play() {
    Scanner scanner = new Scanner(System.in);
    while (true) {
      printBoard();
      int col;
      do {
        System.out.println("Player " + currentPlayer + ", enter a column(1-7): ");
        col = scanner.nextInt() - 1;
      } while (col < 0 || col >= COLS || !dropToken(col));
    if (checkWin()) {
      printBoard();
      System.out.println("Player " + currentPlayer + " wins!");
      break;
    } else if (isBoardFull()) {
        printBoard();
        System.out.println("It's a draw!");
        break;
      }
      currentPlayer = (currentPlayer == 1) ? 2 : 1;
    }
    scanner.close();
  }

  public static void main(String[] args) {
    ConFour game = new ConFour();
    game.play();
  }
}
