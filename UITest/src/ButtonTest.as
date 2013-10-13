package
{
	import app.AppContainer;
	
	import org.hammerc.components.Button;
	
	[SWF(width=800, height=600)]
	public class ButtonTest extends AppContainer
	{
		public function ButtonTest()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var button:Button = new Button();
			button.horizontalCenter = button.verticalCenter = 0;
			button.label = "哈哈哈，我来测试一下！";
			addElement(button);
		}
	}
}
