package  {
	
	import flash.display.MovieClip;
	
	
	public class goodApple extends MovieClip {
		
		private var _appleFalling:Boolean;
		private var _goodAppleCatched:Boolean;
		private var _badAppleCatched:Boolean;
		private var _fallRate:Number = 20;
		private var _score:int = 0;
		
		public function goodApple() {
			x = (Math.random()*600)
			y = 10;
		}
		
		function spawn(){
			this._appleFalling = true;
		}
		
		function update(){
			this.y += _fallRate;
		}
		
		function deSpawn(){
			this._appleFalling = false;
		}
		
		function CatchedApple(){
			_goodAppleCatched = true;
		}
		
		function pointRecived(){
			_goodAppleCatched = false;
		}
		
//---Getters and Setters----------------------------------
		public function get appleFalling():Boolean{
			return _appleFalling;
		}
		
		public function set appleFalling(newappleFalling:Boolean){
			_appleFalling = newappleFalling;
		}
		
		public function get goodAppleCatched():Boolean{
			return _goodAppleCatched;
		}
		
		public function set goodAppleCatched(newgoodAppleCatched:Boolean){
			_goodAppleCatched = newgoodAppleCatched;
		}
		
		public function get badAppleCatched():Boolean{
			return _badAppleCatched;
		}
		
		public function set badAppleCatched(newbadAppleCatched:Boolean){
			_badAppleCatched = newbadAppleCatched;
		}
	}
}