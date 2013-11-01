package
{
	import flash.events.MouseEvent;
	
	import app.AppContainer;
	
	import org.hammerc.components.Alert;
	import org.hammerc.components.Button;
	import org.hammerc.components.Group;
	import org.hammerc.events.CloseEvent;
	import org.hammerc.layouts.VerticalLayout;
	
	[SWF(width=800, height=600)]
	public class AlertTest extends AppContainer
	{
		public function AlertTest()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
//			Alert.yesLabel = "yes";
//			Alert.noLabel = "no";
//			Alert.okLabel = "ok";
//			Alert.cancelLabel = "cancel";
			
			var group:Group = new Group();
			group.horizontalCenter = 0;
			group.verticalCenter = 0;
			group.layout = new VerticalLayout();
			addElement(group);
			
			var btn:Button = new Button();
			btn.label = "测试1";
			btn.addEventListener(MouseEvent.CLICK, btn1ClickHandler);
			group.addElement(btn);
			
			btn = new Button();
			btn.label = "测试2";
			btn.addEventListener(MouseEvent.CLICK, btn2ClickHandler);
			group.addElement(btn);
			
			btn = new Button();
			btn.label = "测试3";
			btn.addEventListener(MouseEvent.CLICK, btn3ClickHandler);
			group.addElement(btn);
			
			btn = new Button();
			btn.label = "测试4";
			btn.addEventListener(MouseEvent.CLICK, btn4ClickHandler);
			group.addElement(btn);
			
			btn = new Button();
			btn.label = "测试5";
			btn.addEventListener(MouseEvent.CLICK, btn5ClickHandler);
			group.addElement(btn);
			
			btn = new Button();
			btn.label = "测试6";
			btn.addEventListener(MouseEvent.CLICK, btn6ClickHandler);
			group.addElement(btn);
			
			btn = new Button();
			btn.label = "测试7";
			btn.addEventListener(MouseEvent.CLICK, btn7ClickHandler);
			group.addElement(btn);
		}
		
		private function btn1ClickHandler(event:MouseEvent):void
		{
			Alert.show("测试一下！", "测试");
		}
		
		private function btn2ClickHandler(event:MouseEvent):void
		{
			Alert.show("测试一下！阿斯蒂芬记录卡岁的金发卢卡斯的来看阿克苏的法兰克斯的金发卢卡斯的来看阿克苏的蒂芬", "测试");
		}
		
		private function btn3ClickHandler(event:MouseEvent):void
		{
			Alert.show("测试一下！", "测试", Alert.YES | Alert.NO, function(event:CloseEvent):void{
				trace(event.detail);
			});
		}
		
		private function btn4ClickHandler(event:MouseEvent):void
		{
			Alert.show("测试一下！", "测试", Alert.OK | Alert.CANCEL, function(event:CloseEvent):void{
				trace(event.detail);
			});
		}
		
		private function btn5ClickHandler(event:MouseEvent):void
		{
			Alert.show("测试一下！", "测试", Alert.YES | Alert.NO | Alert.CANCEL, function(event:CloseEvent):void{
				trace(event.detail);
			});
		}
		
		private function btn6ClickHandler(event:MouseEvent):void
		{
			Alert.show("测试一下！", "测试", Alert.YES | Alert.NO | Alert.OK | Alert.CANCEL, function(event:CloseEvent):void{
				trace(event.detail);
			});
		}
		
		private function btn7ClickHandler(event:MouseEvent):void
		{
			Alert.show("测试一下！", "测试", 4, null, false);
		}
	}
}
