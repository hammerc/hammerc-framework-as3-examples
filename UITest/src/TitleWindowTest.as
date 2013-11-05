package
{
	import app.AppContainer;
	
	import org.hammerc.components.TitleWindow;
	import org.hammerc.managers.PopUpManager;
	
	[SWF(width=800, height=600)]
	public class TitleWindowTest extends AppContainer
	{
		public function TitleWindowTest()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var window:TitleWindow = new TitleWindow();
			window.width = 300;
			window.height = 300;
			window.title = "我是窗口";
			
			PopUpManager.addPopUp(window);
		}
	}
}
