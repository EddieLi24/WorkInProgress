// Eddie Li | May 2024 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[20];
//Button[] progButtons = new Button[1];
//Button[] offButtons = new Button[1];

boolean left;
boolean play;
float l, r, result;
String dVal, op;

void setup() {
  size(400, 480);
  dVal = "0";
  op = "";
  left = true;
  l = 0;
  r = 0;
  result = 0;

  numButtons[0] = new Button(80, 400, 60, 60, "0");
  numButtons[1] = new Button(80, 340, 60, 60, "1");
  numButtons[2] = new Button(140, 340, 60, 60, "2");
  numButtons[3] = new Button(200, 340, 60, 60, "3");
  numButtons[4] = new Button(80, 280, 60, 60, "4");
  numButtons[5] = new Button(140, 280, 60, 60, "5");
  numButtons[6] = new Button(200, 280, 60, 60, "6");
  numButtons[7] = new Button(80, 220, 60, 60, "7");
  numButtons[8] = new Button(140, 220, 60, 60, "8");
  numButtons[9] = new Button(200, 220, 60, 60, "9");
  opButtons[0] = new Button(140, 400, 60, 60, ".");
  opButtons[1] = new Button(200, 400, 60, 60, "=");
  opButtons[2] = new Button(260, 400, 60, 60, "+");
  opButtons[3] = new Button(260, 340, 60, 60, "-");
  opButtons[4] = new Button(260, 280, 60, 60, "x");
  opButtons[5] = new Button(260, 220, 60, 60, "/");
  opButtons[6] = new Button(260, 160, 60, 60, "C");
  opButtons[7] = new Button(200, 160, 60, 60, "x³");
  opButtons[8] = new Button(140, 160, 60, 60, "x²");
  opButtons[9] = new Button(80, 160, 60, 60, "√");
  opButtons[10] = new Button(80, 100, 60, 60, "e");
  opButtons[11] = new Button(140, 100, 60, 60, "π");
  opButtons[12] = new Button(200, 100, 60, 60, "±");
  opButtons[13] = new Button(260, 100, 60, 60, "%");
  opButtons[14] = new Button(320, 160, 60, 60, "sin");
  opButtons[15] = new Button(320, 220, 60, 60, "cos");
  opButtons[19] = new Button(320, 400, 60, 60, "^");
  opButtons[16] = new Button(320, 100, 60, 60, "OFF");
  opButtons[17] = new Button(320, 340, 60, 60, "!");
  opButtons[18] = new Button(320, 280, 60, 60, "tan");
  play = false;
}
void draw() {
  if(!play){
    startScreen();
  } else{
  background(255);

  updateDisplay();

  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  //for (int i=0; i<progButtons.length; i++) {
  //  progButtons[i].display();
  //  progButtons[i].hover(mouseX, mouseY);
  //}
  //for (int i=0; i<offButtons.length; i++) {
  //  offButtons[i].display();
  //  offButtons[i].hover(mouseX, mouseY);
  //}
}
}

void updateDisplay() {
  noFill();
  noStroke();
  rect(10, 10, width-20, 70);

  fill(0);
  textAlign(RIGHT);

  // text scaling
  if (dVal.length()<11) {
    textSize(40);
  } else if (dVal.length()<14) {
    textSize(30);
  } else if (dVal.length()<17) {
    textSize(26);
  } else if (dVal.length()<18) {
    textSize(24);
  } else if (dVal.length()<20) {
    textSize(22);
  } else if (dVal.length()<22) {
    textSize(20);
  } else if (dVal.length()<24) {
    textSize(18);
  } else if (dVal.length()<26) {
    textSize(16);
  } else {
    textSize(14);
  }
  text(dVal, width-20, 60);
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && dVal.length() < 25) {
     handleEvent(numButtons[i].val, true);
    }
  }
  //for (int i=0; i<progButtons.length; i++) {
  //  if (progButtons[i].hover && dVal.length() < 25) {
  //   handleEvent(progButtons[i].val, true);
  //  }
  //}
  //for (int i=0; i<offButtons.length; i++) {
  //  if (offButtons[i].hover && dVal.length() < 25) {
  //   handleEvent(offButtons[i].val, true);
  //  }
  //}
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
    println("  L:" + l + "  R:" + r + "  Op:" + op);
    println("  Result:" + result + "  Left:" + left);
  }
}

void keyPressed() {
  println("  KEY:" + key + "  keyCode:" + keyCode);

  if (key == '0' && dVal.length()<25) {
    handleEvent("0", true);
  } else if (key == '1' && dVal.length()<25) {
    handleEvent("1", true);
  } else if (key == '2' && dVal.length()<25) {
    handleEvent("2", true);
  } else if (key == '3' && dVal.length()<25) {
    handleEvent("3", true);
  } else if (key == '4' && dVal.length()<25) {
    handleEvent("4", true);
  } else if (key == '5' && dVal.length()<25) {
    handleEvent("5", true);
  } else if (key == '6' && dVal.length()<25) {
    handleEvent("6", true);
  } else if (key == '7' && dVal.length()<25) {
    handleEvent("7", true);
  } else if (key == '8' && dVal.length()<25) {
    handleEvent("8", true);
  } else if (key == '9' && dVal.length()<25) {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("×", false);
  } else if (key == '/') {
    handleEvent("÷", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 'e') {
    handleEvent("e", false);
  } else if (key == 8) {
    if (keyCode == BACKSPACE) {
      handleEvent("C", false);
    }
  } else if (key == 10) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  }
  println("  L:" + l + "  R:" + r + "  Op:" + op);
  println("  Result:" + result + "  Left:" + left);
}


float factorial(float n) {
  if ( n == 0 || n ==1) return 1;
  return n*factorial(n-1);
}


String handleEvent(String val, boolean num) {
  if (left && num) {
    if (dVal.equals("0")) {
      dVal = (val);
      l = float(dVal);
    } else {
      dVal += (val);
      l = float(dVal);
    }
  } else if (!left && num) {
    if (dVal.equals("0")) {
      dVal = (val);
      r = float(dVal);
    } else {
      dVal += (val);
      r = float(dVal);
    }
  } else if (val.equals("C")) { //clear button
    dVal = "0";
    op = "";
    left = true;
    l = 0.0;
    r = 0.0;
  } else if (val.equals("OFF")) {
    exit();
  } else if (val.equals("+")) {
    if (!left) {
      performCalc();
    } else {
      op = "+";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("-")) {
    if (!left) {
      performCalc();
    } else {
      op = "-";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("x")) {
    if (!left) {
      performCalc();
    } else {
      op = "x";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("/")) {
    if (!left) {
      performCalc();
    } else {
      op = "/";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("±")) {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  }  else if (val.equals("%")) {
    if (left) {
      l *= 0.1;
      dVal = str(l);
    } else {
      r *= 0.1;
      dVal = str(r);
    }
  } else if (val.equals("π")) {
    if (left) {
      l += 3.14159;
      dVal = str(l);
    } else {
      r += 3.14159;
      dVal = str(r);
    }
  } else if (val.equals("e")) {
    if (left) {
      l += 2.71828;
      dVal = str(l);
    } else {
      r += 2.71828;
      dVal = str(r);
    }
  } else if (val.equals("x²")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("!")) {
    if (left) {
      l = factorial(l);
      dVal = str(l);
    } else {
      r = factorial(r);
      dVal = str(r);
    }
  }else if (val.equals("x³")) {
    if (left) {
      l = pow(l, 3);
      dVal = str(l);
    } else {
      r = pow(r, 3);
      dVal = str(r);
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals(".") && !dVal.contains(".")) {
    dVal += (val);
  } else if (val.equals("=")) {
    performCalc();
  } else if (val.equals("sin")) {
    if (left) {
      l = sin(1);
      dVal = str(l);
    } else {
      r = sin(r);
      dVal = str(r);
    }
  } else if (val.equals("cos")) {
    if (left) {
      l = cos(1);
      dVal = str(l);
    } else {
      r = cos(r);
      dVal = str(r);
    }
  } else if(val.equals("tan")) {
    if (left) {
      l = tan(1);
      dVal = str(l);
    } else {
      r = tan(1);
      dVal = str(r);
    }
  } else if (val.equals("^")) {
     if (!left) {
      performCalc();
    } else {
      op = "^";
      left = false;
      dVal = "0";
    }
  }
  return val;
}

void performCalc() {
  if (op.equals("^")) {
    result = pow(l,r);
  } else if(op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("/")) {
    result = l / r;
  }
  l = result;
  dVal = str(result);
  left = true;
}

void startScreen() {
  background(0);
  fill(255);
  text("Welcome to the Calculator!", width/2-70, height/2-28);
  text("Press any key to start", width/2-30, height/2);
  if (keyPressed) {
    play = true;
  }
}
