<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Simple Calculator</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f2f2f2;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .calculator {
      background: #fff;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }
    input, button {
      margin: 5px;
      padding: 10px;
      font-size: 18px;
      border-radius: 6px;
      border: 1px solid #ccc;
    }
    button {
      cursor: pointer;
      background: #007bff;
      color: white;
      border: none;
    }
    button:hover {
      background: #0056b3;
    }
    .result {
      margin-top: 10px;
      font-weight: bold;
      font-size: 20px;
    }
  </style>
</head>
<body>
  <div class="calculator">
    <h2>Simple Calculator</h2>
    <input type="number" id="num1" placeholder="First number">
    <input type="number" id="num2" placeholder="Second number"><br>
    <button onclick="calculate('+')">+</button>
    <button onclick="calculate('-')">-</button>
    <button onclick="calculate('*')">*</button>
    <button onclick="calculate('/')">/</button>
    <div class="result" id="result"></div>
  </div>

  <script>
    function calculate(op) {
      const a = parseFloat(document.getElementById('num1').value);
      const b = parseFloat(document.getElementById('num2').value);
      let res;

      if (isNaN(a) || isNaN(b)) {
        res = 'Please enter valid numbers.';
      } else {
        switch(op) {
          case '+': res = a + b; break;
          case '-': res = a - b; break;
          case '*': res = a * b; break;
          case '/': res = b !== 0 ? a / b : 'Cannot divide by zero'; break;
        }
      }

      document.getElementById('result').innerText = 'Result: ' + res;
    }
  </script>
</body>
</html>
