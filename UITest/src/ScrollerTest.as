package
{
	import app.AppContainer;
	
	import org.hammerc.components.Button;
	import org.hammerc.components.Group;
	import org.hammerc.components.Scroller;
	import org.hammerc.layouts.VerticalLayout;
	
	[SWF(width=800, height=600)]
	public class ScrollerTest extends AppContainer
	{
		public function ScrollerTest()
		{
			super(false);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var group:Group = new Group();
			group.layout = new VerticalLayout();
			
			for (var i:int = 0; i < 10; i++) 
			{
				var button:Button = new Button();
				button.width = 250;
				button.label = "我是按钮" + i;
				group.addElement(button);
			}
			
			var scroller:Scroller = new Scroller();
			scroller.width = 150;
			scroller.height = 150;
			addElement(scroller);
			
			scroller.viewport = group;
			
			scroller.verticalCenter = 0;
			scroller.horizontalCenter = 0;
		}
	}
}
