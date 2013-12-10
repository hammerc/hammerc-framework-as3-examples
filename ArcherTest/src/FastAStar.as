package
{
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.text.TextField;
	
	[SWF(width="800", height="600")]
	public class FastAStar extends Sprite
	{
		private var _mapView:MapView;
		
		private var _textField:TextField;
		
		public function FastAStar()
		{
			if(stage)
			{
				init();
			}
			else
			{
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_mapView = new MapView();
			_mapView.x = _mapView.y = 10;
			_mapView.setViewport(780, 550);
			_mapView.reset();
			addChild(_mapView);
			
			_mapView.addEventListener(ErrorEvent.ERROR, result);
			
			_textField = new TextField();
			_textField.x = 10;
			_textField.y = 560;
			_textField.width = 580;
			_textField.height = 30;
			_textField.htmlText = '<b><a href="event:reset">点击我刷新地图</a><b>，点击地图选择起点和终点。';
			addChild(_textField);
			
			_textField.addEventListener(TextEvent.LINK, linkHandler);
		}
		
		private function linkHandler(event:TextEvent):void
		{
			_mapView.reset();
		}
		
		private function result(event:ErrorEvent):void
		{
			_textField.htmlText = '<b><a href="event:reset">点击我刷新地图</a><b>，' + event.text;
		}
	}
}
