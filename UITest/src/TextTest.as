package
{
	import app.AppContainer;
	
	import org.hammerc.components.Group;
	import org.hammerc.components.TextArea;
	import org.hammerc.components.TextInput;
	import org.hammerc.layouts.HorizontalAlign;
	import org.hammerc.layouts.VerticalLayout;
	
	[SWF(width=800, height=600)]
	public class TextTest extends AppContainer
	{
		public function TextTest()
		{
			super(false);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 5;
			layout.horizontalAlign = HorizontalAlign.CENTER;
			
			var group:Group = new Group();
			group.horizontalCenter = 0;
			group.verticalCenter = 0;
			group.layout = layout;
			addElement(group);
			
			var textArea:TextArea = new TextArea();
			group.addElement(textArea);
			
			var textInput:TextInput = new TextInput();
			group.addElement(textInput);
		}
	}
}