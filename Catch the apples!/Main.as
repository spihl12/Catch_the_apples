package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	import goodApple;
	import badApple;
	
	public class Main extends MovieClip {
		
		var myBackground1:background1;
		var myBackground2:background2;
		var myTitle:Title;
		var myStartButton:startButton;
		var myHowButton:howToPlayButton;
		var myHowScreen:howToPlay;
		var myBackButton:BackButton;
		var lvlIsActive:Boolean;
		var myFinalScore:finalScore;
		var myReturnButton:returnButton;
		var lostScreenIsActive:Boolean;
		var myBasket:basket;
		var myLifeApples:lifeApples;
		var appleArray:Array;
		var spawnTimer:int;
		var score:int;
		var life:int;
		var textScore:TextField;
		var textFinalScore:TextField;
		var textFinalScoreFormat:TextFormat;
		var myCridits:cridits;
		var myGoodAppleSound:goodAppleSound;
		var myBadAppleSound:badAppleSound;
		var myButtonSound:buttonSound;
		var myBackgroundSound:Kurtass;
		
		public function Main() {
//---Event Listeners-----------------------------------
			stage.addEventListener(MouseEvent.MOUSE_OVER, ButtonAnimation);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, PushButton);
			stage.addEventListener(Event.ENTER_FRAME, update);
			
//---Sounds--------------------------------------------
			myGoodAppleSound = new goodAppleSound;
			myBadAppleSound = new badAppleSound;
			myButtonSound = new buttonSound;
			myBackgroundSound = new Kurtass;
			
//---Objects on the Title Screen-----------------------
			myBackground1 = new background1;
			addChild(myBackground1);
			
			myTitle = new Title;
			myTitle.x = 300;
			myTitle.y = 120;
			
			myHowButton = new howToPlayButton;
			myHowButton.gotoAndStop(1);
			myHowButton.x = 300;
			myHowButton.y = 285;
			
			myStartButton = new startButton;
			myStartButton.gotoAndStop(1);
			myStartButton.x = 300;
			myStartButton.y = 400;
			
			AddTitleScreen();
			myBackgroundSound.play(0,10);
			trace("Welcome to Catch the apples!");
			trace("The 'How to play' butten will explain how the game works");
			trace("The 'START CATCHING APPLES' will start the game");
			trace("---");
			
//---Objects on the How to Play Screen-----------------
			myHowScreen = new howToPlay;
			myHowScreen.x = 50;
			myHowScreen.y = 50;
			
			myBackButton = new BackButton;
			myBackButton.x = 378;
			myBackButton.y = 326;
			
//---Objects on the Level------------------------------
			myBackground2 = new background2;
			
			myBasket = new basket;
			myBasket.y = 455;
			
			myLifeApples = new lifeApples;
			myLifeApples.x = 68;
			myLifeApples.y = 453;
			
			lvlIsActive = false;
			
//---Objects on the Lost screen------------------------
			myFinalScore = new finalScore;
			myFinalScore.x = 54;
			myFinalScore.y = 54;
			
			myReturnButton = new returnButton;
			myReturnButton.gotoAndStop(1);
			myReturnButton.x = 300;
			myReturnButton.y = 400;
			
			myCridits = new cridits;
			myCridits.x = 215;
			myCridits.y = 450;
			
			lostScreenIsActive = false;
			
//---The Apple Array & and spawn timer-----------------
			appleArray = new Array(120);
			for(var i=0; i<100; i++){
				appleArray[i] = new goodApple();
			}
			for(var i=100; i<120; i++){
				appleArray[i] = new badApple();
			}
			spawnTimer = 0;
			
//---The Score Text Fields-----------------------------
			textScore = new TextField;
			textScore.x = 1;
			textScore.y = 1;
			textScore.text = "Score: "+score;
			
			textFinalScore = new TextField;
			textFinalScore.x = 260;
			textFinalScore.y = 170;
			textFinalScore.width = 150;
			textFinalScore.height = 150;
			textFinalScoreFormat = new TextFormat;
			textFinalScoreFormat.font = "Cooper Std";
			textFinalScoreFormat.size = 100;
			
			textFinalScore.defaultTextFormat = textFinalScoreFormat;
		}
//---Functions for the Title Screen--------------------
		function AddTitleScreen(){
			addChild(myTitle);
			addChild(myStartButton);
			addChild(myHowButton);
		}
		function RemoveTitleScreen(){
			removeChild(myTitle);
			removeChild(myStartButton);
			removeChild(myHowButton);
		}
		
//---Functions for the How to Play Screen--------------
		function AddHowTo(){
			addChild(myHowScreen);
			addChild(myBackButton);
		}
		function RemoveHowTo(){
			removeChild(myHowScreen);
			removeChild(myBackButton);
		}
		
//---Functions for the Level---------------------------
		function AddLevel(){
			addChild(myBackground2);
			addChild(myLifeApples);
			addChild(myBasket);
			addChild(textScore);
			myLifeApples.gotoAndStop(3);
			lvlIsActive = true;
			score = 0;
			life = 3;
			Mouse.hide();
		}
		
		function RemoveLevel(){
			removeChild(myBackground2);
			removeChild(myLifeApples);
			removeChild(myBasket);
			removeChild(textScore);
			lvlIsActive = false;
			Mouse.show();
		}
		
//---Functions for the Lost Screen---------------------
		function AddLostScreen(){
			textFinalScore.text = ""+score;
			addChild(myFinalScore);
			addChild(myReturnButton);
			addChild(myCridits);
			addChild(textFinalScore);
			lostScreenIsActive = true;
		}
		function RemoveLostScreen(){
			removeChild(myFinalScore);
			removeChild(myReturnButton);
			removeChild(myCridits);
			removeChild(textFinalScore);
			lostScreenIsActive = false;
		}
		
//---The Button animations-----------------------------
		function ButtonAnimation(event:MouseEvent){
			if(myStartButton == event.target){
				myStartButton.gotoAndStop(2);
			}
			if(myBackground1 == event.target){
				myStartButton.gotoAndStop(1);
			}
			if(myReturnButton == event.target){
				myReturnButton.gotoAndStop(2);
			}
			if(myBackground1 == event.target){
				myReturnButton.gotoAndStop(1);
			}
			if(myHowButton == event.target){
				myHowButton.gotoAndStop(2);
			}
			if(myBackground1 == event.target){
				myHowButton.gotoAndStop(1);
			}
		}
		
//---Pushing the Buttons-------------------------------
		function PushButton(event:MouseEvent){
			if(myStartButton == event.target){
				trace("The game have started! Have fun :D");
				trace("---");
				myButtonSound.play();
				RemoveTitleScreen();
				AddLevel();
			}
			if(myReturnButton == event.target){
				myButtonSound.play();
				RemoveLostScreen();
				AddTitleScreen();
			}
			if(myHowButton == event.target){
				myButtonSound.play();
				AddHowTo();
				trace("No worries we all have to learn the game somehow :)");
				trace("---");
			}
			if(myBackButton == event.target){
				myButtonSound.play();
				RemoveHowTo();
			}
		}
		
//---The Updating Function-----------------------------
		function update(event:Event){
			myBasket.x = mouseX;
			
			if(lvlIsActive == true){
				spawnTimer++;
			}
			if(spawnTimer > 50){
				var rand:int = int(Math.random()*120);
				var apple:MovieClip = appleArray[rand];
				apple.spawn();
				addChild(apple);
				spawnTimer = 0;
			}
			
			for(var i:int = 0; i<120; i++){
				if(appleArray[i].appleFalling == true){
					appleArray[i].update();
					
					if(myBasket.hitTestObject(appleArray[i])){
						removeChild(appleArray[i]);
						appleArray[i].deSpawn();
						appleArray[i].CatchedApple();
					}
				}
				
				if(appleArray[i].goodAppleCatched == true){
					score++;
					myGoodAppleSound.play();
					textScore.text = "Score: "+score;
					trace("Current score is: "+score);
					trace("---");
					appleArray[i].pointRecived();
				}
				
				if(appleArray[i].badAppleCatched == true){
					life--;
					myBadAppleSound.play();
					trace("Lives left: "+life);
					trace("---");
					appleArray[i].pointRecived();
				}
			}
			if(lvlIsActive == true && life == 2){
				myLifeApples.gotoAndStop(2);
			}
			
			if(lvlIsActive == true && life == 1){
				myLifeApples.gotoAndStop(1);
			}
			
			if(lvlIsActive == true && life == 0){
				trace("You lost all your lives! Meaning that the game is over");
				trace("Your final score where: "+score+". Think you can do it better next time? ;3");
				trace("---");
				RemoveLevel();
				AddLostScreen();
			}
		}
	}
}