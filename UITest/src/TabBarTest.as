package
{
	import flash.display.DisplayObject;
	
	import app.AppContainer;
	
	import org.hammerc.collections.ArrayCollection;
	import org.hammerc.components.Button;
	import org.hammerc.components.Label;
	import org.hammerc.components.TabBar;
	import org.hammerc.components.TextArea;
	import org.hammerc.components.ViewStack;
	import org.hammerc.core.UIComponent;
	import org.hammerc.events.IndexChangeEvent;
	
	[SWF(width=800, height=600)]
	public class TabBarTest extends AppContainer
	{
		public function TabBarTest()
		{
			super();
		}
		
		private var _view1:ViewStack;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var tabBar:TabBar = new TabBar();
			tabBar.x = 100;
			tabBar.y = 10;
			//tabBar.dataProvider = new ArrayCollection(["选项1", "选项2", "选项3", "选项4"]);
			tabBar.dataProvider = new ArrayCollection([{text:"选项1"}, {text:"选项2"}, {text:"选项3"}, {text:"选项4"}]);
			tabBar.addEventListener(IndexChangeEvent.CHANGE, tabBar1ChangeHandler);
			addElement(tabBar);
			
			tabBar.labelField = "text";
			
			_view1 = new ViewStack();
			_view1.x = 100;
			_view1.y = 40;
			addElement(_view1);
			
			_view1.addElement(new Button());
			_view1.addElement(new Label());
			_view1.addElement(new TextArea());
			_view1.addElement(new Button());
			
			tabBar = new TabBar();
			tabBar.x = 400;
			tabBar.y = 10;
			addElement(tabBar);
			
			var view2:ViewStack = new ViewStack();
			view2.x = 400;
			view2.y = 40;
			addElement(view2);
			
			var d:DisplayObject = new Button();
			d.name = "tab1";
			view2.addElement(d as UIComponent);
			d = new TextArea();
			d.name = "tab2";
			view2.addElement(d as UIComponent);
			d = new Button();
			d.name = "tab3";
			view2.addElement(d as UIComponent);
			
			tabBar.dataProvider = view2;
		}
		
		private function tabBar1ChangeHandler(event:IndexChangeEvent):void
		{
			_view1.selectedIndex = event.newIndex;
		}
	}
}
