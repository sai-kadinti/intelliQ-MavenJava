<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>2048 Game</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #faf8ef;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    #game {
      display: grid;
      grid-template-columns: repeat(4, 80px);
      grid-gap: 10px;
      background: #bbada0;
      padding: 10px;
      border-radius: 5px;
    }
    .tile {
      width: 80px;
      height: 80px;
      background: #cdc1b4;
      font-size: 24px;
      font-weight: bold;
      display: flex;
      justify-content: center;
      align-items: center;
      border-radius: 5px;
    }
    .tile[data-val="0"] { background: #cdc1b4; color: #cdc1b4; }
    .tile[data-val="2"] { background: #eee4da; color: #776e65; }
    .tile[data-val="4"] { background: #ede0c8; color: #776e65; }
    .tile[data-val="8"] { background: #f2b179; color: #f9f6f2; }
    .tile[data-val="16"] { background: #f59563; color: #f9f6f2; }
    .tile[data-val="32"] { background: #f67c5f; color: #f9f6f2; }
    .tile[data-val="64"] { background: #f65e3b; color: #f9f6f2; }
    .tile[data-val="128"] { background: #edcf72; color: #f9f6f2; }
    .tile[data-val="256"] { background: #edcc61; color: #f9f6f2; }
    .tile[data-val="512"] { background: #edc850; color: #f9f6f2; }
    .tile[data-val="1024"] { background: #edc53f; color: #f9f6f2; }
    .tile[data-val="2048"] { background: #edc22e; color: #f9f6f2; }
  </style>
</head>
<body>
  <div id="game"></div>

  <script>
    const size = 4;
    let board = [];

    function initBoard() {
      board = Array(size).fill().map(() => Array(size).fill(0));
      addTile();
      addTile();
      render();
    }

    function addTile() {
      let empty = [];
      for (let r = 0; r < size; r++) {
        for (let c = 0; c < size; c++) {
          if (board[r][c] === 0) empty.push([r, c]);
        }
      }
      if (empty.length > 0) {
        let [r, c] = empty[Math.floor(Math.random() * empty.length)];
        board[r][c] = Math.random() < 0.9 ? 2 : 4;
      }
    }

    function render() {
      const game = document.getElementById('game');
      game.innerHTML = '';
      board.forEach(row => {
        row.forEach(val => {
          const tile = document.createElement('div');
          tile.className = 'tile';
          tile.textContent = val === 0 ? '' : val;
          tile.dataset.val = val;
          game.appendChild(tile);
        });
      });
    }

    function rotateLeft(matrix) {
      return matrix[0].map((_, i) => matrix.map(row => row[i])).reverse();
    }

    function rotateRight(matrix) {
      return matrix[0].map((_, i) => matrix.map(row => row[i]).reverse());
    }

    function moveLeft() {
      let moved = false;
      for (let r = 0; r < size; r++) {
        let row = board[r].filter(v => v);
        for (let c = 0; c < row.length - 1; c++) {
          if (row[c] === row[c + 1]) {
            row[c] *= 2;
            row[c + 1] = 0;
            moved = true;
          }
        }
        row = row.filter(v => v);
        while (row.length < size) row.push(0);
        if (board[r].toString() !== row.toString()) moved = true;
        board[r] = row;
      }
      if (moved) {
        addTile();
        render();
      }
    }

    function moveRight() {
      board = board.map(row => row.reverse());
      moveLeft();
      board = board.map(row => row.reverse());
    }

    function moveUp() {
      board = rotateLeft(board);
      moveLeft();
      board = rotateRight(board);
    }

    function moveDown() {
      board = rotateLeft(board);
      moveRight();
      board = rotateRight(board);
    }

    window.addEventListener('keydown', (e) => {
      if (e.key === 'ArrowLeft') moveLeft();
      if (e.key === 'ArrowRight') moveRight();
      if (e.key === 'ArrowUp') moveUp();
      if (e.key === 'ArrowDown') moveDown();
    });

    initBoard();
  </script>
</body>
</html>
