package
{
	import flash.events.Event;
	
	import app.AppContainer;
	
	import org.hammerc.components.Group;
	import org.hammerc.components.HScrollBar;
	import org.hammerc.components.HSlider;
	import org.hammerc.components.Label;
	import org.hammerc.components.ProgressBar;
	import org.hammerc.components.VScrollBar;
	import org.hammerc.components.VSlider;
	import org.hammerc.layouts.HorizontalAlign;
	import org.hammerc.layouts.VerticalLayout;
	
	[SWF(width=800, height=600)]
	public class RangeTest extends AppContainer
	{
		private var _progressBar:ProgressBar;
		
		public function RangeTest()
		{
			super();
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
			
			_progressBar = new ProgressBar();
			_progressBar.width = 150;
			group.addElement(_progressBar);
			
			var hScrollBar:HScrollBar = new HScrollBar();
			hScrollBar.addEventListener(Event.CHANGE, hsbChangeHandler);
			group.addElement(hScrollBar);
			
			var hsbLabel:Label = new Label();
			hsbLabel.text = hScrollBar.value + "/" + hScrollBar.maximum;
			group.addElement(hsbLabel);
			
			var vScrollBar:VScrollBar = new VScrollBar();
			vScrollBar.addEventListener(Event.CHANGE, vsbChangeHandler);
			group.addElement(vScrollBar);
			
			var vsbLabel:Label = new Label();
			vsbLabel.text = vScrollBar.value + "/" + vScrollBar.maximum;
			group.addElement(vsbLabel);
			
			var hSlider:HSlider = new HSlider();
			hSlider.addEventListener(Event.CHANGE, hsChangeHandler);
			group.addElement(hSlider);
			
			var hsLabel:Label = new Label();
			hsLabel.text = hSlider.value + "/" + hSlider.maximum;
			group.addElement(hsLabel);
			
			var vSlider:VSlider = new VSlider();
			vSlider.addEventListener(Event.CHANGE, vsChangeHandler);
			group.addElement(vSlider);
			
			var vsLabel:Label = new Label();
			vsLabel.text = vSlider.value + "/" + vSlider.maximum;
			group.addElement(vsLabel);
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			function hsbChangeHandler(event:Event):void
			{
				hsbLabel.text = hScrollBar.value + "/" + hScrollBar.maximum;
			}
			
			function vsbChangeHandler(event:Event):void
			{
				vsbLabel.text = vScrollBar.value + "/" + vScrollBar.maximum;
			}
			
			function hsChangeHandler(event:Event):void
			{
				hsLabel.text = hSlider.value + "/" + hSlider.maximum;
			}
			
			function vsChangeHandler(event:Event):void
			{
				vsLabel.text = vSlider.value + "/" + vSlider.maximum;
			}
		}
		
		private function enterFrameHandler(event:Event):void
		{
			_progressBar.value++;
			if(_progressBar.value == _progressBar.maximum)
			{
				_progressBar.value = 0;
			}
		}
	}
}
