package
{
	import flash.events.MouseEvent;
	
	import app.AppContainer;
	
	import org.hammerc.components.Button;
	import org.hammerc.components.Group;
	import org.hammerc.layouts.HorizontalAlign;
	import org.hammerc.layouts.VerticalLayout;
	
	[SWF(width=800, height=600)]
	public class StyleTest extends AppContainer
	{
		[Embed(source="01.png")]
		public var img1:Class;
		
		[Embed(source="02.png")]
		public var img2:Class;
		
		[Embed(source="03.png")]
		public var img3:Class;
		
		[Embed(source="04.png")]
		public var img4:Class;
		
		public function StyleTest()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var button:Button = new Button();
			button.label = "按钮";
			button.x = 100;
			button.y = 100;
			button.skinName = IconButtonSkin;
			addElement(button);
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 5;
			layout.horizontalAlign = HorizontalAlign.CENTER;
			
			var group:Group = new Group();
			group.horizontalCenter = 0;
			group.verticalCenter = 0;
			group.layout = layout;
			addElement(group);
			
			var btn:Button = new Button();
			btn.label = "icon1";
			btn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{
				button.setStyle("icon", img1);
			});
			group.addElement(btn);
			
			btn = new Button();
			btn.label = "icon2";
			btn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{
				button.setStyle("icon", img2);
			});
			group.addElement(btn);
			
			btn = new Button();
			btn.label = "icon3";
			btn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{
				button.setStyle("icon", img3);
			});
			group.addElement(btn);
			
			btn = new Button();
			btn.label = "icon4";
			btn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{
				button.setStyle("icon", img4);
			});
			group.addElement(btn);
			
			btn = new Button();
			btn.label = "no icon";
			btn.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{
				button.clearStyle("icon");
			});
			group.addElement(btn);
		}
	}
}
