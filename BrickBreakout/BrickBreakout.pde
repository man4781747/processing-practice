Racket[] racket = new Racket[1];
Ball[] ball = new Ball[1];
Brick[] brick = new Brick[0];

float F_keybord_press=0;
float F_Racket_x_position_mid;      
float F_Racket_long = 50.0;
float F_Racket_hight = 10.0;
float F_Racket_y_position_mid = 100.0;
float Ball_speed_base = 5;
int I_ball_num;



void setup() {
  size(1000,1000);
  F_Racket_y_position_mid = height - F_Racket_y_position_mid;
  F_Racket_x_position_mid = width/2;
  racket[0] = new Racket();
  ball[0] = new Ball();
  
  float[][] Base_Brick_x;
  float[][] Base_Brick_y;
  Base_Brick_x = new float[5][8];
  Base_Brick_y = new float[5][8];
  for (int i = 0;i<Base_Brick_x.length;i++) {
    for (int j = 0;j<Base_Brick_x[i].length;j++) {
      Base_Brick_x[i][j] = 60+125*j;
      Base_Brick_y[i][j] = 55+55*i;
    }
  }
  Brick[] brick_ = new Brick[Base_Brick_x.length*Base_Brick_x[0].length];
  println(Base_Brick_x.length*Base_Brick_x[0].length);
  I_ball_num = 1;
  
  for (int i=0;i<Base_Brick_x.length;i++){

    for (int j=0;j<Base_Brick_x[i].length;j++){
      brick_[i*Base_Brick_x[i].length+j] = new Brick(Base_Brick_x[i][j],Base_Brick_y[i][j]);
    }
  }
  
  brick = brick_;
}

void keyPressed() {
  
  
  if (key==' '){
    Ball[] ball_ = new Ball[ball.length + 1];
    for (int i=0; i < ball.length;i++) {
       ball_[i] = ball[i];
    }
    ball_[ball.length] = new Ball();
    ball = ball_;
    I_ball_num = I_ball_num + 1;
  }
  
  if (key=='A'||key=='a'){
    Brick[] brick_ = new Brick[brick.length + 1];
    for (int i=0; i < brick.length;i++) {
       brick_[i] = brick[i];
    }
    brick_[brick.length] = new Brick(mouseX,mouseY);
    brick = brick_;
  }
  
  
}

void draw() {
  background(0);
  racket[0].Racket_update();
  F_Racket_x_position_mid = racket[0].F_Racket_x;
  
  for (int i=0; i < ball.length;i++) {
    ball[i].Ball_update();

    racket[0].Racket_ball_distand(ball[i].x,ball[i].y,ball[i].Ball_x_speed,ball[i].Ball_y_speed);
    ball[i].Ball_y_speed = racket[0].ball_speed_y_Racket;
    ball[i].Ball_x_speed = racket[0].ball_speed_x_Racket;
  }
  for (int j=0; j < brick.length;j++) {
     brick[j].Brick_build();
     for (int i=0; i < ball.length;i++) {
         brick[j].Brick_ball_distand(ball[i].x,ball[i].y,ball[i].Ball_x_speed,ball[i].Ball_y_speed);
         ball[i].Ball_y_speed = brick[j].ball_speed_y_Brick;
         ball[i].Ball_x_speed = brick[j].ball_speed_x_Brick;
     }
  }
  
  BrickDistroy();
  BallDistroy();
  
}
