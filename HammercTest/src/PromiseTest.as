package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import org.hammerc.promise.Promise;
	
	public class PromiseTest extends Sprite
	{
		public function PromiseTest()
		{
			addEventListener(Event.ENTER_FRAME, function(event:Event):void{
				//trace("enterframe");
			});
			
			//chainTest();
			//resolveTest();
			//rejectTest();
			//allTest();
			//raceTest();
		}
		
		private function func(msg, delay):Promise
		{
			return new Promise(function(resolve:Function, reject:Function):void{
				setTimeout(function():void{
					if(msg == "3")
						reject("Error asd");
					resolve(msg);
					//trace("finish");
				}, delay);
			});
		}
		
		private function chainTest():void
		{
			func("1", 500).then(function(value:*):*{
				trace(value);
				return func("2", 500);
			}).then(function(value:*):*{
				trace(value);
				return func("3", 500);
			}).then(function(value:*):*{
				trace(value);
				return func("4", 500);
			}).then(function(value:*):*{
				trace(value);
			}).caught(function(error:*):*{
				trace("Error");
			});
		}
		
		private function resolveTest():void
		{
			Promise.resolve(42).then(function(value:*):*{
				trace(value);
			});
		}
		
		private function rejectTest():void
		{
			Promise.reject(new Error("BOOM!")).caught(function(error:*):*{
				trace(error);
			});
		}
		
		private function allTest():void
		{
			var promise:Promise = Promise.all([func("1", 500), func("2", 500), func("3", 500), func("4", 500)]);
			promise.then(function(value:*):*{
				trace(value);
			}).caught(function(error:*):*{
				trace("Error");
			});
		}
		
		private function raceTest():void
		{
			var promise:Promise = Promise.race([func("3", 500), func("2", 500), func("1", 500), func("4", 500)]);
			promise.then(function(value:*):*{
				trace(value);
			}).caught(function(error:*):*{
				trace("Error");
			});
		}
	}
}
