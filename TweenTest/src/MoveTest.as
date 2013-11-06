package
{
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import app.AppContainer;
	
	import org.hammerc.core.UIComponent;
	import org.hammerc.tween.Tween;
	import org.hammerc.tween.easing.Linear;
	
	[SWF(width=800, height=600, frameRate=60)]
	public class MoveTest extends AppContainer
	{
		private var _uiComponent:UIComponent;
		
		private var _ball:Shape;
		
		// 1 秒会移动的距离
		private var _speed:Number = 250;
		
		private var _count:int = 0;
		
		public function MoveTest()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			_uiComponent = new UIComponent();
			addElement(_uiComponent);
			
			_ball = new Shape();
			_ball.x = stage.stageWidth >> 1;
			_ball.y = stage.stageHeight >> 1;
			_ball.graphics.beginFill(0xff0000);
			_ball.graphics.drawCircle(0, 0, 20);
			_ball.graphics.endFill();
			_uiComponent.addChild(_ball);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		private function mouseDownHandler(event:MouseEvent):void
		{
			var dist:Number = Point.distance(new Point(_ball.x, _ball.y), new Point(event.stageX, event.stageY));
			var time:Number = dist / _speed;
			
			Tween.to(_ball, time, {ease:Linear.easeNone, x:event.stageX, y:event.stageY, onComplete:moveEndHandler}/*, false*/);
		}
		
		private function moveEndHandler():void
		{
			trace("move end " + _count++);
		}
	}
}
